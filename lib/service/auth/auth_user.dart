import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

//I'm not trying to expose my firebase user to the UI , so i'm cretaing a user class to copy Firebase user into it
@immutable
class AuthUser {
  final String id;
  final bool isEmailVerified;
  final String email;

  const AuthUser({
    required this.isEmailVerified,
    required this.id,
    required this.email,
  });
  //Copying Firebase user into my AuthUser class
  factory AuthUser.fromFirebase(User user) => AuthUser(
        isEmailVerified: user.emailVerified,
        id: user.uid,
        email: user.email!,
      );
}
