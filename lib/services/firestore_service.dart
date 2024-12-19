import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance; // Instance de Firestore

  // Créer un nouveau document utilisateur
  Future<void> createUser(String userId, Map<String, dynamic> userData) async {
    await _db.collection('users').doc(userId).set(userData);
  }

  // Lire un document utilisateur
  Future<DocumentSnapshot> getUser(String userId) async {
    return await _db.collection('users').doc(userId).get();
  }

  // Mettre à jour un document utilisateur
  Future<void> updateUser(String userId, Map<String, dynamic> userData) async {
    await _db.collection('users').doc(userId).update(userData);
  }

  // Supprimer un document utilisateur
  Future<void> deleteUser(String userId) async {
    await _db.collection('users').doc(userId).delete();
  }

  // Lire tous les documents utilisateurs
  Future<List<DocumentSnapshot>> getAllUsers() async {
    QuerySnapshot querySnapshot = await _db.collection('users').get();
    return querySnapshot.docs;
  }

  // Récupérer l'ID d'un document utilisateur
  String uid(String userId) {
    return _db.collection('users').doc(userId).id;
  }
}
