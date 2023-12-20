import 'package:flutter/material.dart';

class ResponsiveContainer extends StatelessWidget {
  final double desiredWidthInPixels;
  final double desiredHeightInPixels;
  final Color? color;
  final Widget? child;

  const ResponsiveContainer({
    super.key,
    required this.desiredWidthInPixels,
    required this.desiredHeightInPixels,
    this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    double widthPercentage = (desiredWidthInPixels / screenWidth) * 100;
    double heightPercentage = (desiredHeightInPixels / screenHeight) * 100;

    double responsiveWidth = screenWidth * (widthPercentage / 100);
    double responsiveHeight = screenHeight * (heightPercentage / 100);

    return Container(
      width: responsiveWidth.toDouble(),
      height: responsiveHeight.toDouble(),
      color: color,
      child: child,
    );
  }
}
