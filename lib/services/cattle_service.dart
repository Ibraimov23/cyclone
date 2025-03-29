import 'package:cloud_firestore/cloud_firestore.dart';

class CattleService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<String>> getCattleTypes() async {
    final snapshot = await _db.collection('cattle_types').get();
    return snapshot.docs.map((doc) => doc['name'] as String).toList();
  }
}
