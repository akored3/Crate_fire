import 'package:crate_fire/constants/constants.dart';
import 'package:crate_fire/constants/routes.dart';
import 'package:crate_fire/service/auth/auth_exceptions.dart';
import 'package:crate_fire/service/auth/auth_service.dart';
import 'package:crate_fire/utilities/button.dart';
import 'package:crate_fire/utilities/dialog/show_error_dialog.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: defaultPadding * 4.5),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.5,
      // color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            controller: _email,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).brightness == Brightness.light
                      ? bodyTextColorLightTheme
                      : secondaryColorLightTheme,
                ),
              ),
              labelText: 'Email',
            ),
          ),
          TextField(
            controller: _password,
            autocorrect: false,
            obscureText: true,
            decoration: InputDecoration(
              focusColor: Colors.white,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).brightness == Brightness.light
                        ? bodyTextColorLightTheme
                        : secondaryColorLightTheme),
              ),
              labelText: 'Password',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 210),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              try {
                final email = _email.text;
                final password = _password.text;
                await AuthService.fireBase().login(
                  email: email,
                  password: password,
                );
                final user = AuthService.fireBase().currentUser;
                if (user?.isEmailVirefied ?? false) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      helloPageRoute, (route) => false);
                } else {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    verifyEmailRoute,
                    (route) => false,
                  );
                }
              } on UserNotFoundAuthException {
                await showErrorDialog(
                  context,
                  'User not found',
                );
              } on WrongPasswordAuthException {
                await showErrorDialog(
                  context,
                  'Invalid credentials',
                );
              } on GenericAuthException {
                await showErrorDialog(
                  context,
                  'Error occured',
                );
              }
            },
            child: const Button(
              borderRadius: 10,
              textColor: secondaryColorLightTheme,
              buttonText: 'Sign in',
              buttonColor: [primaryColor2, primaryColor1],
            ),
          )
        ],
      ),
    );
  }
}
