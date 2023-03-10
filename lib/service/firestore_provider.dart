import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crate_fire/service/auth/auth_exceptions.dart';

class FirestoreProvider {
  static Future<Map<String, dynamic>> getUserdata(String userId) async {
    final userDocRef =
        FirebaseFirestore.instance.collection('users').doc(userId);
    final userDocSnapshot = await userDocRef.get();
    if (userDocSnapshot.exists) {
      return userDocSnapshot.data() as Map<String, dynamic>;
    } else {
      throw UserNotFoundAuthException();
    }
  }
}
