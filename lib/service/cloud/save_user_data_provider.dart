//This class is going to be implemented by a class called FirebaseFirestore so as to implement functionalities to save user's datas , pleasewhat can i name this class
abstract class UserDataSaverProvider {
  Future<void> saveUsername({required String userName});
  Future<void> saveOtherUserData({
    required String fullName,
    required String dateOfBirth,
    required String gender,
    required String country,
  });
}
