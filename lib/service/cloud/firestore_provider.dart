import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crate_fire/service/auth/auth_exceptions.dart';
import 'package:crate_fire/service/auth/auth_service.dart';
import 'package:crate_fire/service/cloud/save_user_data_provider.dart';

class FirebaseFirestoreProvider implements UserDataSaverProvider {
  final _user = AuthService.fireBase().currentUser;
  final _db = FirebaseFirestore.instance;

  @override
  Future<void> saveOtherUserData({
    required String fullName,
    required String dateOfBirth,
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
        'dateOfBirth': dateOfBirth,
        'gender': gender,
        'country': country,
      });
    } on FirebaseException catch (e) {
      throw FirebaseException(
        plugin: '',
        code: e.code,
        message: e.message,
      );
    }
  }

  @override
  Future<void> saveUsername({
    required String userName,
  }) async {
    final user = _user;
    if (user == null) {
      throw UserNotFoundAuthException();
    }
    final userDocRef = _db.collection('users').doc(user.id);
    await userDocRef.set(
      {'username': userName},
      SetOptions(merge: true),
    );
  }

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

  @override
  Future<void> saveContentCategories({
    required List<String> categories,
  }) async {
    final user = _user;
    if (user == null) {
      throw UserNotFoundAuthException();
    }
    final userDocRef = _db.collection('users').doc(user.id);
    await userDocRef.set(
        {
          'categories': FieldValue.arrayUnion([categories])
        },
        SetOptions(
          merge: true,
        ));
  }
}
