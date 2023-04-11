import 'package:crate_fire/constants/constants.dart';
import 'package:crate_fire/constants/routes.dart';
import 'package:crate_fire/service/auth/auth_service.dart';
import 'package:crate_fire/service/auth/bloc/auth_bloc.dart';
import 'package:crate_fire/service/auth/bloc/auth_event.dart';
import 'package:crate_fire/utilities/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            GradientButton(
              label: 'Send email verification',
              height: MediaQuery.of(context).size.height / 10,
              gradient:
                  const LinearGradient(colors: [primaryColor2, primaryColor1]),
              onPressed: () {
                context
                    .read<AuthBloc>()
                    .add(const AuthEventSendEmailVerification());
              },
            ),
            const SizedBox(
              height: 15,
            ),
            GradientButton(
              label: 'Restart',
              height: MediaQuery.of(context).size.height / 10,
              gradient: const LinearGradient(colors: [
                blackGradient,
                blackGradient,
              ]),
              onPressed: () async {
                await AuthService.fireBase().logout();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  getsStartedPageRoute,
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
