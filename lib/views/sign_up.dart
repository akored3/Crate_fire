// ignore_for_file: use_build_context_synchronously
import 'package:crate_fire/constants/constants.dart';
import 'package:crate_fire/service/auth/bloc/auth_bloc.dart';
import 'package:crate_fire/service/auth/bloc/auth_event.dart';
import 'package:crate_fire/service/cloud/firestore_provider.dart';
import 'package:crate_fire/utilities/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      margin: const EdgeInsets.only(top: defaultPadding * 2.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
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
            controller: _username,
            keyboardType: TextInputType.name,
            autocorrect: false,
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.check_circle),
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
              suffixIcon: const Icon(Icons.password),
              // suffixIcon:  IconButton(onPressed: (){}, icon:Icon(Icons.hide) ),
              focusColor: Colors.white,
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).brightness == Brightness.light
                          ? bodyTextColorLightTheme
                          : secondaryColorLightTheme)),
              labelText: 'Password',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: defaultPadding * 2),
            child: GradientButton(
              label: 'Sign up',
              height: MediaQuery.of(context).size.height / 10,
              gradient:
                  const LinearGradient(colors: [primaryColor2, primaryColor1]),
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                final username = _username.text;
                await FirestoreProvider().saveUsername(username: username);
                context.read<AuthBloc>().add(
                      AuthEventRegister(email, password),
                    );
              },
            ),
          ),
          TextButton(
            onPressed: () {
              context.read<AuthBloc>().add(
                    const AuthEventLogout(),
                  );
            },
            child: Text(
              'Already registered?, click HERE to Log in',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          )
        ],
      ),
    );
  }
}
