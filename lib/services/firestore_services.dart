import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/stado_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createStado(Stado stado) async {
    try {
      final docRef = await _db.collection('stados').add(stado.toMap());
      String stadoId = docRef.id;
      print("✅ Стадо создано с ID: $stadoId");

      await docRef.update({"stadoId": stadoId});
      print("✅ stadoId обновлён в документе стада");

      final List<String> feedTypes = [
        "barley",
        "corns",
        "flax",
        "hays",
        "herbs",
        "oats",
        "peas",
        "silages",
        "straws",
      ];
      for (var feed in feedTypes) {
        await docRef.collection("tables").doc(feed).set({
          "name": feed,
          "value": 0,
          "createdAt": Timestamp.now(),
        });
        print("✅ Таблица '$feed' создана в таблицах стада");
      }

      print("🎉 Все таблицы успешно созданы в коллекции 'tables' стада!");
    } catch (e) {
      print("❌ Ошибка при создании стада или таблиц: $e");
    }
  }

  static Future<void> addAnimal({
    required String stadoId,
    required String ownerId,
    required String tagnumber,
    required String gender,
    required int age,
    required double weight,
    required String breed,
    required String health,
    required int medCard,
  }) async {
    final docRef = FirebaseFirestore.instance
        .collection("users")
        .doc(ownerId)
        .collection("stados")
        .doc(stadoId)
        .collection("animals")
        .doc(); // auto-generated ID

    await docRef.set({
      "animalID": docRef.id,
      "tagnumber": tagnumber,
      "floor": gender,
      "age": age,
      "weight": weight,
      "breed": breed,
      "health": health,
      "medical_card": medCard,
      'stadoId': stadoId,
      "createdAt": Timestamp.now(),
    });
  }

  Future<List<Stado>> getStados() async {
    final snapshot = await _db.collection('stado').get();
    return snapshot.docs.map((doc) => Stado.fromMap(doc.data())).toList();
  }
}
