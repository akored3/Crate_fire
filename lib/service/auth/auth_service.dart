import 'package:crate_fire/service/auth/auth_provider.dart';
import 'package:crate_fire/service/auth/auth_user.dart';
import 'package:crate_fire/service/auth/firbase_auth_provider.dart';

//The AuthService class is now what we expose to our UI!

class AuthService implements AuthProvider {
  final AuthProvider provider;
  const AuthService(this.provider);

  factory AuthService.fireBase() => AuthService(FirebaseAuthProvider());

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) =>
      provider.createUser(email: email, password: password);

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser> login({
    required String email,
    required String password,
  }) =>
      provider.login(email: email, password: password);

  @override
  Future<void> logout() => provider.logout();
  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();

  @override
  Future<void> initialize() => provider.initialize();

  @override
  Future<void> saveUsername(String username) => provider.saveUsername(username);
}
