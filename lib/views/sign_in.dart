import 'package:crate_fire/constants/constants.dart';
import 'package:crate_fire/utils/button.dart';
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
            onTap: () {
              print('button clicked');
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
