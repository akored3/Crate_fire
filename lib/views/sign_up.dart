import 'package:crate_fire/constants.dart';
import 'package:crate_fire/utils/button.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
            onTap: () {
              print('button clicked');
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
