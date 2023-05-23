import 'package:crate_fire/service/cloud/firestore_provider.dart';
import 'package:crate_fire/service/cloud/save_user_data_provider.dart';

class FirestoreService implements UserDataSaverProvider {
  final UserDataSaverProvider provider;
  const FirestoreService(this.provider);

  factory FirestoreService.fireStore() =>
      FirestoreService(FirebaseFirestoreProvider());

  @override
  Future<void> saveOtherUserData({
    required String fullName,
    required String dateOfBirth,
    required String gender,
    required String country,
  }) =>
      provider.saveOtherUserData(
          fullName: fullName,
          dateOfBirth: dateOfBirth,
          gender: gender,
          country: country);

  @override
  Future<void> saveUsername({required String userName}) =>
      provider.saveUsername(userName: userName);

  @override
  Future<void> saveContentCategories({
    required List<String> categories,
  }) =>
      provider.saveContentCategories(
        categories: categories,
      );
}
