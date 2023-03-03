import 'package:crate_fire/constants.dart';
import 'package:crate_fire/views/sign_in.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(defaultPadding * 2),
          // color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hi, welcome back to Crate',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Container(
                  margin: const EdgeInsets.only(top: defaultPadding * 2),
                  child: Image.asset(
                    'assets/images/signin.png',
                  ),
                ),
                Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SignInForm(),
                Container(
                  margin: const EdgeInsets.only(
                      top: defaultPadding * 4, bottom: defaultPadding * 2),
                  child: Text(
                    'Or sign in using',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.facebook_sharp),
                      Icon(Icons.reddit_outlined),
                      Icon(Icons.search),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
