import 'package:crate_fire/constants/routes.dart';
import 'package:crate_fire/service/auth/auth_service.dart';
import 'package:crate_fire/theme.dart';
import 'package:crate_fire/views/get_started.dart';
import 'package:crate_fire/views/setup_profile.dart';
import 'package:crate_fire/views/sign_in_page.dart';
import 'package:crate_fire/views/sign_up_page.dart';
import 'package:crate_fire/views/signin_signup.dart';
import 'package:crate_fire/views/verify_email_view.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        signInRoute: (context) => const SignInPage(),
        signUpRoute: (context) => const SignUpPage(),
        signInSignUpRoute: (context) => const SignInSignUp(),
        helloPageRoute: (context) => const SetUpProfile(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
        getsStartedPageRoute: (context) => const GetStartedPage(),
      },
      title: 'Crate_fire',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.fireBase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.fireBase().currentUser;
            if (user != null) {
              if (user.isEmailVirefied) {
                return const SetUpProfile();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const GetStartedPage();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
