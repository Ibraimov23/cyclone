import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../generated/l10n.dart';

class Steam extends StatefulWidget {
  const Steam({super.key});

  @override
  State<Steam> createState() => _SteamState();
}

class _SteamState extends State<Steam> {
  String? storageDocId;
  Map<String, dynamic> storageData = {};

  Map<String, String> get fieldLabels => getFieldLabels(context);

  Map<String, String> getFieldLabels(BuildContext context) {
    final loc = S.of(context);
    return {
      'oats': loc.fieldOats,
      'corns': loc.fieldCorns,
      'silages': loc.fieldSilages,
      'straws': loc.fieldStraws,
      'peas': loc.fieldPeas,
      'herbs': loc.fieldHerbs,
      'hays': loc.fieldHays,
    };
  }

  @override
  void initState() {
    super.initState();
    _createStorageIfMissing();
  }

  Future<void> _createStorageIfMissing() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final snapshot = await FirebaseFirestore.instance
        .collection('storages')
        .where('ownerId', isEqualTo: user.uid)
        .limit(1)
        .get();

    if (snapshot.docs.isEmpty) {
      await FirebaseFirestore.instance.collection('storages').add({
        'ownerId': user.uid,
        ...Map.fromEntries(fieldLabels.keys.map((k) => MapEntry(k, 0.0))),
      });
    }
  }

  Future<void> _updateStorageValue(String key, double newValue) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null || storageDocId == null) return;

    await FirebaseFirestore.instance
        .collection('storages')
        .doc(storageDocId)
        .update({key: newValue});

    setState(() {
      storageData[key] = newValue;
    });
  }

  Widget _buildStorageTable(Map<String, dynamic> data) {
    final loc = S.of(context);
    const horizontalPadding = 32.0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Color(0xFF90010A),
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding, vertical: 12),
                    child: Text(
                      loc.nameColumn,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Color(0xFF90010A),
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding, vertical: 12),
                    child: Text(
                      loc.valueColumn,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ),
            ],
          ),
          ...fieldLabels.entries.map((entry) {
            final key = entry.key;
            final label = entry.value;
            final value = data[key]?.toString() ?? '0';

            return Container(
              padding: EdgeInsets.symmetric(
                  vertical: 12, horizontal: horizontalPadding),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color(0xFFEEEEEE)),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      label,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final newValue = await _showEditDialog(context, value);
                        if (newValue != null && newValue.isNotEmpty) {
                          final parsed = double.tryParse(newValue);
                          if (parsed != null) {
                            _updateStorageValue(key, parsed);
                          }
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            loc.unitKg(value),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 8),
                          SvgPicture.asset('assets/icons/pen.svg'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Future<String?> _showEditDialog(
      BuildContext context, String currentValue) async {
    final loc = S.of(context);
    final controller = TextEditingController(text: currentValue);
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            loc.changeValue,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          content: TextField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              hintText: loc.changeValue,
              hintStyle: const TextStyle(color: Colors.grey),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            style: const TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                loc.cancel,
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, controller.text),
              child: Text(
                loc.save,
                style: const TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = S.of(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: StreamBuilder<QuerySnapshot>(
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
            return const Center(child: CircularProgressIndicator());
          }

          final doc = snapshot.data!.docs.first;
          storageDocId = doc.id;
          storageData = doc.data() as Map<String, dynamic>;

          return Container(
            decoration: const BoxDecoration(
              color: Color(0xFFE7E7E7),
              image: DecorationImage(
                image: AssetImage('assets/pattern.png'),
                fit: BoxFit.none,
                repeat: ImageRepeat.repeat,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  loc.storageTitle,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 23),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _buildStorageTable(storageData),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
