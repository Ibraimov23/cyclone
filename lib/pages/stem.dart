import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../generated/l10n.dart';

class Steam extends StatefulWidget {
  const Steam({Key? key}) : super(key: key);

  @override
  State<Steam> createState() => _SteamState();
}

class _SteamState extends State<Steam> {
  String? storageDocId;
  Map<String, dynamic> storageData = {};
  List<Map<String, dynamic>> allFeeds = [];

  @override
  void initState() {
    super.initState();
    _ensureStorageExists();
  }

  Future<void> _ensureStorageExists() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final storagesRef = FirebaseFirestore.instance.collection('storages');

    final querySnapshot =
        await storagesRef.where('ownerId', isEqualTo: user.uid).limit(1).get();

    if (querySnapshot.docs.isEmpty) {
      final docRef = await storagesRef.add({'ownerId': user.uid});
      setState(() {
        storageDocId = docRef.id;
        storageData = {};
      });
    } else {
      final doc = querySnapshot.docs.first;
      setState(() {
        storageDocId = doc.id;
        storageData = doc.data();
      });
    }
  }

  Future<void> _updateStorageValue(String key, double newValue) async {
    if (storageDocId == null) return;
    try {
      await FirebaseFirestore.instance
          .collection('storages')
          .doc(storageDocId)
          .update({'$key.value': newValue});
      setState(() {
        if (storageData[key] is Map<String, dynamic>) {
          storageData[key]['value'] = newValue;
        }
      });
    } catch (e) {
      debugPrint('Error updating value: $e');
    }
  }

  Future<void> _addNewFeed() async {
    final loc = S.of(context);
    final nameController = TextEditingController();
    final valueController = TextEditingController();
    final feedUnitController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 30,
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(loc.addNewFeedTitle,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: loc.feedNameHint,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.label),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? loc.fieldRequired : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: valueController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: loc.feedValueHint,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.scale),
                  ),
                  validator: (value) {
                    final val = double.tryParse(value ?? '');
                    return val == null ? loc.editDialog_invalidNumber : null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: feedUnitController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: loc.feedUnitHint,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.restaurant),
                  ),
                  validator: (value) {
                    final val = double.tryParse(value ?? '');
                    return val == null ? loc.editDialog_invalidNumber : null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF90010A),
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  icon: const Icon(Icons.save),
                  label: Text(loc.save,
                      style: const TextStyle(color: Colors.white)),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final name = nameController.text.trim();
                      final value = double.parse(valueController.text.trim());
                      final feedUnit =
                          double.parse(feedUnitController.text.trim());
                      Navigator.pop(context);
                      final user = FirebaseAuth.instance.currentUser;
                      if (user == null) return;
                      final firestore = FirebaseFirestore.instance;
                      final userId = user.uid;
                      final storageRef =
                          firestore.collection('storages').doc(storageDocId);
                      final storageDataToUpdate = {
                        'ownerId': userId,
                        name: {
                          'value': value,
                          'feedUnit': feedUnit,
                        }
                      };
                      try {
                        await storageRef.set(
                            storageDataToUpdate, SetOptions(merge: true));
                        debugPrint('Updated storage for $name');
                      } catch (e) {
                        debugPrint('Failed to update storage: $e');
                      }
                      final stadosSnapshot = await firestore
                          .collection('stados')
                          .where('userId', isEqualTo: userId)
                          .get();

                      for (final herdDoc in stadosSnapshot.docs) {
                        final herdId = herdDoc.id;
                        for (int i = 1; i <= 6; i++) {
                          final receptionId = 'reception $i';
                          final feedsCollection = firestore
                              .collection('stados')
                              .doc(herdId)
                              .collection('tables')
                              .doc(receptionId)
                              .collection('feeds');
                          final existingFeed = await feedsCollection
                              .where('name', isEqualTo: name)
                              .limit(1)
                              .get();
                          if (existingFeed.docs.isEmpty) {
                            await feedsCollection.add({
                              'name': name,
                              'value': 0.0,
                              'feedUnit': feedUnit,
                              'createdAt': FieldValue.serverTimestamp(),
                            });
                            debugPrint('Created $name in $herdId/$receptionId');
                          } else {
                            debugPrint(
                                '$name already exists in $herdId/$receptionId');
                          }
                        }
                      }
                      setState(() {
                        storageData[name] = value;
                      });
                    }
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> deleteFeedEverywhere(String feedNameToDelete) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      debugPrint('User not authenticated');
      return;
    }
    final userId = user.uid;
    try {
      final storagesSnapshot = await FirebaseFirestore.instance
          .collection('storages')
          .where('ownerId', isEqualTo: userId)
          .get();

      for (final storageDoc in storagesSnapshot.docs) {
        final data = storageDoc.data();
        if (data.containsKey(feedNameToDelete)) {
          await storageDoc.reference.update({
            feedNameToDelete: FieldValue.delete(),
          });
          debugPrint(
              'Deleted feed "$feedNameToDelete" from storage ${storageDoc.id}');
        }
      }
      final stadosSnapshot = await FirebaseFirestore.instance
          .collection('stados')
          .where('userId', isEqualTo: userId)
          .get();
      for (final herdDoc in stadosSnapshot.docs) {
        final herdId = herdDoc.id;
        for (int receptionNumber = 1; receptionNumber <= 6; receptionNumber++) {
          final receptionId = 'reception $receptionNumber';

          final feedsCollectionRef = FirebaseFirestore.instance
              .collection('stados')
              .doc(herdId)
              .collection('tables')
              .doc(receptionId)
              .collection('feeds');

          final feedDocsSnapshot = await feedsCollectionRef
              .where('name', isEqualTo: feedNameToDelete)
              .get();
          for (final feedDoc in feedDocsSnapshot.docs) {
            await feedDoc.reference.delete();
            debugPrint(
                'Deleted feed "$feedNameToDelete" in $herdId/$receptionId');
          }
        }
        final storageDocRef =
            FirebaseFirestore.instance.collection('storages').doc(herdId);
        final storageSnapshot = await storageDocRef.get();
        if (storageSnapshot.exists) {
          final data = storageSnapshot.data();
          if (data != null && data.containsKey(feedNameToDelete)) {
            await storageDocRef.update({
              feedNameToDelete: FieldValue.delete(),
            });
            debugPrint('Deleted feed "$feedNameToDelete" from storage $herdId');
          }
        }
      }
    } catch (e) {
      debugPrint('Ошибка удаления корма "$feedNameToDelete": $e');
    }
  }

  Future<String?> _showEditDialog(BuildContext context, String currentValue) {
    final loc = S.of(context);
    final controller = TextEditingController(text: currentValue);
    final Color accentColor = const Color(0xFF90010A);
    return showDialog<String>(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                loc.changeValue,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: accentColor,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: controller,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: loc.changeValue,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: accentColor.withOpacity(0.7)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: accentColor, width: 2),
                  ),
                  filled: true,
                  fillColor: accentColor.withOpacity(0.05),
                ),
                autofocus: true,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, null),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      foregroundColor: accentColor.withOpacity(0.8),
                    ),
                    child: Text(loc.cancel),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      final input = controller.text.trim();
                      final value = double.tryParse(input);
                      if (value == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(loc.invalidNumber)),
                        );
                        return;
                      }
                      Navigator.pop(context, input);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accentColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      loc.save,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStorageTable(Map<String, dynamic> data) {
    final loc = S.of(context);
    final keys = data.keys.where((key) => key != 'ownerId').toList();
    const horizontalPadding = 25.0;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 14, horizontal: horizontalPadding),
                  decoration: const BoxDecoration(
                    color: Color(0xFF90010A),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                    ),
                  ),
                  child: Text(
                    loc.nameColumn,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 14, horizontal: horizontalPadding),
                  decoration: const BoxDecoration(
                    color: Color(0xFF90010A),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Text(
                    loc.valueColumn,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          ),
          ...keys.asMap().entries.map((entry) {
            final index = entry.key;
            final key = entry.value;
            final rawData = data[key];
            if (rawData is! Map<String, dynamic>)
              return const SizedBox.shrink();
            final raw = rawData;
            final isLast = index == keys.length - 1;
            return Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 14, horizontal: horizontalPadding),
              decoration: BoxDecoration(
                color: index.isEven ? Colors.white : const Color(0xFFF9F9F9),
                border: const Border(
                  top: BorderSide(color: Color(0xFFE0E0E0)),
                ),
                borderRadius: isLast
                    ? const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      )
                    : null,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      key,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () async {
                            final newValue = await _showEditDialog(
                                context, raw['value'].toString());
                            if (newValue != null && newValue.isNotEmpty) {
                              final parsed = double.tryParse(newValue);
                              if (parsed != null) {
                                await _updateStorageValue(key, parsed);
                              }
                            }
                          },
                          child: Row(
                            children: [
                              Text(
                                loc.unitKg(raw['value']),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.all(4),
                                child: SvgPicture.asset(
                                  'assets/icons/pen.svg',
                                  width: 18,
                                  height: 18,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () async {
                            final confirmed = await showDialog<bool>(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  elevation: 24,
                                  backgroundColor: Colors.white,
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(24, 20, 24, 24),
                                  title: Row(
                                    children: [
                                      Icon(Icons.warning_amber_rounded,
                                          color: Colors.redAccent, size: 28),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          loc.deleteFeedConfirmation(key),
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  actionsPadding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 20),
                                  actions: [
                                    OutlinedButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                      style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        side: BorderSide(
                                            color: Colors.grey.shade400),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24, vertical: 12),
                                      ),
                                      child: Text(
                                        loc.cancel,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey[800]),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.redAccent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24, vertical: 12),
                                        elevation: 4,
                                      ),
                                      child: Text(
                                        loc.delete,
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                            if (confirmed == true) {
                              await deleteFeedEverywhere(key);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(loc.successTitle)),
                              );
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            child: const Icon(
                              Icons.delete_outline,
                              color: Colors.redAccent,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = S.of(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewFeed,
        backgroundColor: const Color(0xFF90010A),
        child: const Icon(Icons.add, size: 40, color: Colors.white),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('storages')
            .where('ownerId', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
            .limit(1)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                loc.noStorageFound,
                style: const TextStyle(fontSize: 16),
              ),
            );
          }
          final doc = snapshot.data!.docs.first;
          storageDocId = doc.id;
          storageData = doc.data();

          return Container(
            decoration: const BoxDecoration(
              color: Color(0xFFE7E7E7),
              image: DecorationImage(
                image: AssetImage('assets/pattern.png'),
                fit: BoxFit.none,
                repeat: ImageRepeat.repeat,
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              children: [
                Text(
                  loc.storageTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 25),
                _buildStorageTable(storageData),
              ],
            ),
          );
        },
      ),
    );
  }
}
