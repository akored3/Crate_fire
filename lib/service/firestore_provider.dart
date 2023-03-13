import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crate_fire/service/auth/auth_exceptions.dart';
import 'package:crate_fire/service/auth/auth_service.dart';

class FirestoreProvider {
  final _user = AuthService.fireBase().currentUser;
  final _db = FirebaseFirestore.instance;

  Future<void> saveUsername({
    required String username,
  }) async {
    final user = _user;
    if (user == null) {
      throw UserNotLoggedInAuthException();
    }
    final userDocRef = _db.collection('users').doc(user.id);
    await userDocRef.set(
      {'username': username},
      //Set options merges this field with any other field in the document,
      //it doesn't overwrite them
      SetOptions(merge: true),
    );
  }

//is this function ok?
  Future<void> saveOtherUserData({
    required String fullName,
    required DateTime dateOfBirth,
    required String gender,
    required String country,
  }) async {
    final user = _user;
    if (user == null) {
      throw UserNotFoundAuthException();
    }
    final userDocRef = _db.collection('users').doc(user.id);
    try {
      await userDocRef.update({
        'fullName': fullName,
        'dateOfBirth': Timestamp.fromDate(dateOfBirth),
        'gender': gender,
        'country': country
      });
    } catch (e) {
      throw FirebaseException(
          code: 'update failed', message: 'Failed', plugin: '');
    }
  }

//Why declare this function static?
  static Future<Map<String, dynamic>> getUserdata({
    required String userId,
  }) async {
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
