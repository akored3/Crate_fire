import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class AuthEventInitialize extends AuthEvent {
  const AuthEventInitialize();
}

class AuthEventSendEmailVerification extends AuthEvent {
  const AuthEventSendEmailVerification();
}

class AuthEventLogin extends AuthEvent {
  final String email;
  final String password;

  const AuthEventLogin(this.email, this.password);
}

class AuthEventRegister extends AuthEvent {
  final String email;
  final String password;
  final String username;

  const AuthEventRegister(
    this.email,
    this.password,
    this.username,
  );
}

class AuthEventSetupUserProfile extends AuthEvent {
  final String fullName;
  final String dateOfBirth;
  final String gender;
  final String country;

  const AuthEventSetupUserProfile(
    this.fullName,
    this.dateOfBirth,
    this.gender,
    this.country,
  );
}

class AuthEventShouldRegister extends AuthEvent {
  const AuthEventShouldRegister();
}

class AuthEventForgotPassword extends AuthEvent {
  final String? email;

  const AuthEventForgotPassword(this.email);
}

class AuthEventLogout extends AuthEvent {
  const AuthEventLogout();
}
