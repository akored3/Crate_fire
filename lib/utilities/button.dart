import 'package:crate_fire/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

typedef OnPressed = void Function();

class GradientButton extends StatelessWidget {
  final String? label;
  final OnPressed? onPressed;
  final double? width;
  final double? height;
  final Gradient gradient;
  final Color? labelTextColor;
  const GradientButton({
    super.key,
    this.label,
    this.onPressed,
    this.width,
    this.height,
    required this.gradient,
    this.labelTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final buttonWidth = width ?? screenWidth;
    final buttonHeight = height ?? screenHeight;

    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            elevation: 5,
            shadowColor: Colors.purple,
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
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  color: labelTextColor,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(text: label),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
