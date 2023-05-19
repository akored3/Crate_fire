import 'package:bloc/bloc.dart';
import 'package:crate_fire/service/auth/auth_provider.dart';
import 'package:crate_fire/service/auth/bloc/auth_event.dart';
import 'package:crate_fire/service/auth/bloc/auth_state.dart';
import 'package:crate_fire/service/cloud/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    AuthProvider provider,
  ) : super(const AuthStateUninitialized(isLoading: true)) {
    //Initialize
    on<AuthEventInitialize>((event, emit) async {
      await provider.initialize();
      final user = provider.currentUser;
      if (user == null) {
        emit(AuthStateLoggedOut(
          exception: null,
          isLoading: false,
        ));
      } else if (!user.isEmailVerified) {
        emit(const AuthStateNeedsVerification(isLoading: false));
      } else {
        emit(AuthStateLoggedIn(
          user: user,
          isLoading: false,
        ));
      }
    });

    //Send email verification
    on<AuthEventSendEmailVerification>((event, emit) async {
      await provider.sendEmailVerification();
      emit(state);
    });

    //Register
    on<AuthEventRegister>((event, emit) async {
      final email = event.email;
      final password = event.password;
      final username = event.username;
      try {
        await provider.createUser(
          email: email,
          password: password,
        );
        await FirestoreService.fireStore().saveUsername(userName: username);
        emit(const AuthStateSettingUpProfile(
          isLoading: false,
          exception: null,
        ));
      } on Exception catch (e) {
        emit(AuthStateRegistering(
          exception: e,
          isLoading: false,
        ));
      }
    });

    on<AuthEventSetupUserProfile>((event, emit) async {
      final fullName = event.fullName;
      final dateOfBirth = event.dateOfBirth;
      final gender = event.gender;
      final country = event.country;
      try {
        await FirestoreService.fireStore().saveOtherUserData(
            fullName: fullName,
            dateOfBirth: dateOfBirth,
            gender: gender,
            country: country);
        emit(state);
      } on Exception catch (e) {
        emit(AuthStateSettingUpProfile(
          isLoading: false,
          exception: e,
        ));
      }
    });

    //Login
    on<AuthEventLogin>((event, emit) async {
      emit(AuthStateLoggedOut(
        exception: null,
        isLoading: true,
        loadingText: 'Logging in!',
      ));
      final email = event.email;
      final password = event.password;
      try {
        final user = await provider.login(
          email: email,
          password: password,
        );
        if (!user.isEmailVerified) {
          emit(const AuthStateNeedsVerification(
            isLoading: false,
          ));
        } else {
          emit(AuthStateLoggedOut(
            exception: null,
            isLoading: false,
          ));
        }
        emit(AuthStateLoggedIn(
          user: user,
          isLoading: false,
        ));
      } on Exception catch (e) {
        emit(AuthStateLoggedOut(
          exception: e,
          isLoading: false,
        ));
      }
    });

    on<AuthEventShouldRegister>((event, emit) async {
      emit(const AuthStateRegistering(
        exception: null,
        isLoading: false,
      ));
    });

//Log out
    on<AuthEventLogout>((event, emit) async {
      try {
        await provider.logout();
        emit(AuthStateLoggedOut(
          exception: null,
          isLoading: false,
        ));
      } on Exception catch (e) {
        emit(AuthStateLoggedOut(
          exception: e,
          isLoading: false,
        ));
      }
    });

//Forgot password
    on<AuthEventForgotPassword>((event, emit) async {
      emit(const AuthStateForgotPassword(
        exception: null,
        hasSentEmail: false,
        isLoading: false,
      ));

      final email = event.email;
      if (email == null) {
        return;
      }
      emit(const AuthStateForgotPassword(
        exception: null,
        hasSentEmail: false,
        isLoading: true,
      ));
      bool didSendEmail = false;
      Exception? exception;
      try {
        await provider.sendPasswordReset(toEmail: email);
      } on FirebaseAuthException catch (e) {
        exception = e;
        didSendEmail = false;
      }
      emit(AuthStateForgotPassword(
        exception: exception,
        hasSentEmail: didSendEmail,
        isLoading: false,
      ));
    });
  }
}
