import 'package:crate_fire/constants/constants.dart';
import 'package:crate_fire/constants/routes.dart';
import 'package:crate_fire/utilities/button.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/womanie.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  blackGradient.withOpacity(0.2),
                  primaryColor2.withOpacity(0.3),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: defaultPadding * 2,
              horizontal: defaultPadding * 2,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // This TextButton doesn't work , why?
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          signInRoute, (route) => false);
                    },
                    child: const Text(
                      'Skip To Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          signInSignUpRoute, (route) => false);
                    },
                    child: const Button(
                      borderRadius: defaultPadding,
                      buttonColor: [Colors.white, Colors.white],
                      textColor: Colors.deepPurple,
                      buttonText: 'Get Started',
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
