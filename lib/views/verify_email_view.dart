import 'package:crate_fire/constants/constants.dart';
import 'package:crate_fire/constants/routes.dart';
import 'package:crate_fire/service/auth/auth_service.dart';
import 'package:crate_fire/utilities/button.dart';
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
      body: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/sent.png',
              width: 350,
              height: 150,
            ),
            const SizedBox(
              height: defaultPadding * 2,
            ),
            Text(
              'Please Verify your Email ',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'Address',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("We've sent you email verification. "),
            const Text('Please open it to verify your account'),
            const Text("If you haven't recieved a verification email yet,"),
            const Text(' press the button below'),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4.0,
            ),
            GestureDetector(
              onTap: () async {
                await AuthService.fireBase().sendEmailVerification();
              },
              child: const Button(
                borderRadius: defaultPadding * 2,
                textColor: secondaryColorLightTheme,
                buttonText: 'Send email Verification',
                buttonColor: [primaryColor2, primaryColor1],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                await AuthService.fireBase().logout();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  getsStartedPageRoute,
                  (route) => false,
                );
              },
              child: const Button(
                borderRadius: defaultPadding * 2,
                textColor: secondaryColorLightTheme,
                buttonText: 'Restart',
                buttonColor: [blackGradient, blackGradient],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
