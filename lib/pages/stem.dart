import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Steam extends StatefulWidget {
  const Steam({super.key});

  @override
  State<Steam> createState() => _SteamState();
}

class _SteamState extends State<Steam> {
  String? storageDocId;
  Map<String, dynamic> storageData = {};

  final Map<String, String> fieldLabels = {
    'oats': 'Овес',
    'corns': 'Кукуруза',
    'silages': 'Силос',
    'straws': 'Солома',
    'peas': 'Горох',
    'herbs': 'Трава',
    'hays': 'Сено',
  };

  @override
  void initState() {
    super.initState();
    _loadOrInitStorage();
  }

  Future<void> _loadOrInitStorage() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final snapshot = await FirebaseFirestore.instance
        .collection('storages')
        .where('ownerId', isEqualTo: user.uid)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      final doc = snapshot.docs.first;
      setState(() {
        storageDocId = doc.id;
        storageData = doc.data();
      });
    } else {
      setState(() {
        storageDocId = null;
        storageData = {
          'oats': 0.0,
          'corns': 0.0,
          'silages': 0.0,
          'straws': 0.0,
          'peas': 0.0,
          'herbs': 0.0,
          'hays': 0.0,
        };
      });
    }
  }

  Future<void> _updateStorageValue(String key, double newValue) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    if (storageDocId == null) {
      final docRef =
          await FirebaseFirestore.instance.collection('storages').add({
        'ownerId': user.uid,
        ...storageData,
        key: newValue,
      });
      setState(() {
        storageDocId = docRef.id;
        storageData[key] = newValue;
      });
    } else {
      await FirebaseFirestore.instance
          .collection('storages')
          .doc(storageDocId)
          .update({key: newValue});
      setState(() {
        storageData[key] = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Container(
        // Здесь указываем фон, который будет заполнять весь экран
        decoration: const BoxDecoration(
          color: Color(0xFFE7E7E7),
          image: DecorationImage(
            image: AssetImage('assets/pattern.png'),
            fit: BoxFit.cover,
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              // Expanded чтобы фон занимал все доступное пространство
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Склад кормов",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 23),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
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
                              children: const [
                                Expanded(
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF90010A),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 20),
                                          Text(
                                            'Название',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF90010A),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Text(
                                        'Значение',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ...fieldLabels.entries.map((entry) {
                              final key = entry.key;
                              final label = entry.value;
                              final value = storageData[key]?.toString() ?? '0';

                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            30, 12, 12, 12),
                                        child: Text(
                                          label,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            12, 12, 30, 12),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                String? newValue =
                                                    await _showEditDialog(
                                                        context, value);
                                                if (newValue != null &&
                                                    newValue.isNotEmpty) {
                                                  final parsed =
                                                      double.tryParse(newValue);
                                                  if (parsed != null) {
                                                    _updateStorageValue(
                                                        key, parsed);
                                                  }
                                                }
                                              },
                                              child: Text(
                                                "$value кг",
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            SvgPicture.asset(
                                                'assets/icons/pen.svg'),
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
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> _showEditDialog(
      BuildContext context, String currentValue) async {
    final controller = TextEditingController(text: currentValue);
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Изменить значение'),
          content: TextField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration:
                const InputDecoration(hintText: 'Введите новое значение'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, controller.text),
              child: const Text('Сохранить'),
            ),
          ],
        );
      },
    );
  }
}
