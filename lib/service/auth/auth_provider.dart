import 'package:crate_fire/service/auth/auth_user.dart';

abstract class AuthProvider {
  Future<void> initialize();
  AuthUser? get currentUser;
  Future<AuthUser> login({
    required String email,
    required String password,
  });
  Future<AuthUser> createUser({
    required String email,
    required String password,
  });
  Future<void> saveUsername(String username);
  Future<void> logout();
  Future<void> sendEmailVerification();
}