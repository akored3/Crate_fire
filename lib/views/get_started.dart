import 'package:crate_fire/constants/constants.dart';
import 'package:crate_fire/service/auth/bloc/auth_bloc.dart';
import 'package:crate_fire/service/auth/bloc/auth_event.dart';
import 'package:crate_fire/utilities/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  TextButton(
                    onPressed: () {
                      // Navigator.of(context).pushNamedAndRemoveUntil(
                      //     signInRoute, (route) => false);
                      context.read<AuthBloc>().add(
                            const AuthEventLogout(),
                          );
                    },
                    child: const Text(
                      'Skip To Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  GradientButton(
                    onPressed: () {
                      // Navigator.of(context).pushNamedAndRemoveUntil(
                      //     signInSignUpRoute, (route) => false);
                      context
                          .read<AuthBloc>()
                          .add(const AuthEventShouldRegister());
                    },
                    gradient: const LinearGradient(
                        colors: [Colors.white, Colors.white]),
                    label: 'Get Started',
                    labelTextColor: Colors.deepPurple,
                    width: MediaQuery.of(context).size.width / 0.5,
                    height: MediaQuery.of(context).size.height / 13,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
