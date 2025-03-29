import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/stado_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createStado(Stado stado) async {
    await _db.collection('stado').add(stado.toMap());
  }

  Future<List<Stado>> getStados() async {
    final snapshot = await _db.collection('stado').get();
    return snapshot.docs.map((doc) => Stado.fromMap(doc.data())).toList();
  }
}
