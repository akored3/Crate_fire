import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

//I'm not trying to expose my firebase user to the UI , so i'm cretaing a user class to copy Firebase user into it
@immutable
class AuthUser {
  final bool isEmailVirefied;
  const AuthUser(this.isEmailVirefied);
  //Copying Firebase user into my AuthUser class
  factory AuthUser.fromFirebase(User user) => AuthUser(user.emailVerified);
}
