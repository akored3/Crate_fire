import 'package:crate_fire/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.borderRadius,
    required this.buttonColor,
    required this.textColor,
    required this.buttonText,
  });

  final double borderRadius;
  final List<Color> buttonColor;
  final Color textColor;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 12.5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: buttonColor,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: RichText(
          text: TextSpan(
              style: GoogleFonts.montserrat(
                fontSize: 15,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(text: buttonText),
              ]),
        ),
      ),
    );
  }
}

typedef OnPressed = void Function();

class GradientButton extends StatelessWidget {
  final String label;
  final OnPressed? onPressed;
  final double? width;
  final double? height;
  final Gradient gradient;

  const GradientButton({
    super.key,
    required this.label,
    this.onPressed,
    this.width,
    this.height,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            // primary: Colors.transparent,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultPadding),
            )),
        child: Ink(
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(defaultPadding),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              label,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
