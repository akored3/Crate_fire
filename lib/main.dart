import 'package:crate_fire/constants/routes.dart';
import 'package:crate_fire/service/auth/bloc/auth_bloc.dart';
import 'package:crate_fire/service/auth/bloc/auth_event.dart';
import 'package:crate_fire/service/auth/bloc/auth_state.dart';
import 'package:crate_fire/service/auth/firebase_auth_provider.dart';
import 'package:crate_fire/theme.dart';
import 'package:crate_fire/views/get_started.dart';
import 'package:crate_fire/views/setup_profile.dart';
import 'package:crate_fire/views/sign_in_page.dart';
import 'package:crate_fire/views/sign_up_page.dart';
import 'package:crate_fire/views/signin_signup.dart';
import 'package:crate_fire/views/verify_email_view.dart';
import 'package:crate_fire/views/welcome_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//How can i apply it to this code
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        // signInRoute: (context) => const SignInPage(),
        // signUpRoute: (context) => const SignUpPage(),
        // signInSignUpRoute: (context) => const SignInSignUp(),
        // welcomeUserPageRoute: (context) => const WelcomeUser(),
        // verifyEmailRoute: (context) => const VerifyEmailView(),
        // getsStartedPageRoute: (context) => const GetStartedPage(),
        setupProfilePageRoute: (context) => const SetUpProfile(),
      },
      title: 'Crate_fire',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      home: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(FirebaseAuthProvider()),
        child: const HomePage(),
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(
          const AuthEventInitialize(),
        );

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthStateLoggedIn) {
          return const WelcomeUser();
        } else if (state is AuthStateNeedsVerification) {
          return const VerifyEmailView();
        } else if (state is AuthStateLoggedOut) {
          return const SignInPage();
        } else if (state is AuthStateRegistering) {
          return const SignUpPage();
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
