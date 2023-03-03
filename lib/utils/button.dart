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
                fontWeight: FontWeight.w400,
              ),
              children: [
                TextSpan(text: buttonText),
              ]),
        ),
      ),
    );
  }
}
