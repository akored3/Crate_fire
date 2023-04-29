import 'package:crate_fire/constants/constants.dart';
import 'package:crate_fire/service/auth/bloc/auth_bloc.dart';
import 'package:crate_fire/service/auth/bloc/auth_event.dart';
import 'package:crate_fire/utilities/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      // color: Colors.black,
      margin: const EdgeInsets.only(top: defaultPadding * 4.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.2,
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
              onPressed: () {
                context.read<AuthBloc>().add(const AuthEventForgotPassword());
              },
              child: Text(
                'Forgot Password',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 1),
            child: GradientButton(
              label: 'Sign in',
              gradient: const LinearGradient(
                colors: [primaryColor2, primaryColor1],
              ),
              onPressed: () async {
                final password = _password.text;
                final email = _email.text;
                context.read<AuthBloc>().add(
                      AuthEventLogin(
                        email,
                        password,
                      ),
                    );
              },
              height: MediaQuery.of(context).size.height / 10,
            ),
          ),
          TextButton(
            onPressed: () {
              context.read<AuthBloc>().add(
                    const AuthEventShouldRegister(),
                  );
            },
            child: Text(
              'Not registered?, click HERE to sign up',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          )
        ],
      ),
    );
  }
}
