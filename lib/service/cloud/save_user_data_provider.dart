abstract class UserDataSaverProvider {
  Future<void> saveUsername({required String userName});
  Future<void> saveOtherUserData({
    required String fullName,
    required String dateOfBirth,
    required String gender,
    required String country,
  });
  Future<void> saveContentCategories({
    required List<String> categories,
  });
}
