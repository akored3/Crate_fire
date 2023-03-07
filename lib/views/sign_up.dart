import 'package:crate_fire/constants.dart';
import 'package:crate_fire/service/auth/auth_exceptions.dart';
import 'package:crate_fire/service/auth/auth_service.dart';
import 'package:crate_fire/utils/button.dart';
import 'package:crate_fire/utils/show_error_dialog.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _username;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _username = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _username.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: defaultPadding * 3.5),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.0,
      // color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // TextField(
          //   decoration: InputDecoration(
          //     focusedBorder: UnderlineInputBorder(
          //         borderSide: BorderSide(
          //       color: Theme.of(context).brightness == Brightness.light
          //           ? bodyTextColorLightTheme
          //           : secondaryColorLightTheme,
          //     )),
          //     labelText: 'Username',
          //   ),
          // ),
          TextField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            decoration: InputDecoration(
              focusColor: Colors.white,
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).brightness == Brightness.light
                          ? bodyTextColorLightTheme
                          : secondaryColorLightTheme)),
              labelText: 'Email',
            ),
          ),
          TextField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            decoration: InputDecoration(
              focusColor: Colors.white,
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).brightness == Brightness.light
                          ? bodyTextColorLightTheme
                          : secondaryColorLightTheme)),
              labelText: 'Username',
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
                          : secondaryColorLightTheme)),
              labelText: 'Password',
            ),
          ),
          GestureDetector(
            onTap: () async {
              late final email = _email.text;
              late final password = _password.text;
              late final username = _username.text;
              try {
                await AuthService.fireBase().createUser(
                  email: email,
                  password: password,
                );
                await AuthService.fireBase().saveUsername(username);
                await AuthService.fireBase().sendEmailVerification();
              } on WeakPasswordAuthException {
                await showErrDialog(
                  context,
                  'Weak password',
                );
              } on EmailAlreadyInUseAuthException {
                await showErrDialog(
                  context,
                  'Email already in use',
                );
              } on InvalidEmailAuthException {
                await showErrorDialog(
                  context,
                  'Invalid email',
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
              buttonText: 'Sign up',
              buttonColor: [primaryColor2, primaryColor1],
            ),
          )
        ],
      ),
    );
  }
}
