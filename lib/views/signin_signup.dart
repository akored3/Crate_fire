import 'package:crate_fire/constants/constants.dart';
import 'package:crate_fire/views/sign_in.dart';
import 'package:crate_fire/views/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInSignUp extends StatefulWidget {
  const SignInSignUp({super.key});

  @override
  State<SignInSignUp> createState() => _SignInSignUpState();
}

class _SignInSignUpState extends State<SignInSignUp> {
  bool _isLoginForm = true;

  void _toogleForm() {
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

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
              children: [
                Text(
                  'Hi, welcome to Crate',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: _toogleForm,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: defaultPadding),
                            // color: Colors.blue,
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Text(
                              'Sign in',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.normal,
                                  fontSize: defaultPadding,
                                  color: !_isLoginForm
                                      ? Colors.grey
                                      : Colors.white),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 300,
                            width: MediaQuery.of(context).size.width / 4.5,
                            color: !_isLoginForm ? Colors.black : primaryColor2,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: _toogleForm,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: defaultPadding),
                            // color: Colors.blue,
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Text(
                              'Sign up',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.normal,
                                  fontSize: defaultPadding,
                                  color: _isLoginForm
                                      ? Colors.grey
                                      : Colors.white),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 300,
                            width: MediaQuery.of(context).size.width / 4.2,
                            color: _isLoginForm ? Colors.black : primaryColor2,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Offstage(
                  offstage: !_isLoginForm,
                  child: const SignInForm(),
                ),
                Offstage(
                  offstage: _isLoginForm,
                  child: const SignUpForm(),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: defaultPadding * 4, bottom: defaultPadding),
                  child: Text(
                    _isLoginForm ? 'Or sign in using' : 'Or sign up using',
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
