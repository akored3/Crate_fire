import 'package:crate_fire/constants/routes.dart';
import 'package:crate_fire/service/auth/auth_service.dart';
import 'package:flutter/material.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Column(
        children: [
          const Text(
              "We've sent you email verification. Please open it to verify your account"),
          const Text(
              "If you haven't recieved a verification email yet, press the button below"),
          TextButton(
            onPressed: () async {
              await AuthService.fireBase().sendEmailVerification();
            },
            child: const Text('Send email Verification'),
          ),
          TextButton(
            onPressed: () async {
              await AuthService.fireBase().logout();
              Navigator.of(context).pushNamedAndRemoveUntil(
                signUpRoute,
                (route) => false,
              );
            },
            child: const Text('Restart'),
          )
        ],
      ),
    );
  }
}
