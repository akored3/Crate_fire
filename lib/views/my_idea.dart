import 'package:crate_fire/constants/constants.dart';
import 'package:crate_fire/utilities/button.dart';
import 'package:flutter/material.dart';

class MyIdea extends StatelessWidget {
  const MyIdea({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: const [
        GradientButton(
          gradient: LinearGradient(
            colors: [blackGradient, blackGradient],
          ),
          height: 100,
          width: 200,
        ),
        GradientButton(
          gradient: LinearGradient(
            colors: [primaryColor1, primaryColor2],
          ),
          height: 100,
          width: 70,
        ),
      ],
    ));
  }
}
