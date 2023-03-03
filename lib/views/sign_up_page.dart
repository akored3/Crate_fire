import 'package:crate_fire/constants.dart';
import 'package:crate_fire/views/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                  'Hi, welcome  to Crate',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Container(
                  margin: const EdgeInsets.only(top: defaultPadding * 2),
                  child: Image.asset(
                    'assets/images/signup.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                Text(
                  'Sign Up',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SignUpForm(),
                Container(
                  margin: const EdgeInsets.only(
                      top: defaultPadding * 4, bottom: defaultPadding),
                  child: Text(
                    'Or sign up using',
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
