import 'package:crate_fire/constants/constants.dart';
import 'package:crate_fire/utilities/button.dart';
import 'package:flutter/material.dart';

typedef DialogOptionsBuilder<T> = Map<String, T> Function();

Future<T?> showGenericDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
  required DialogOptionsBuilder optionsBuilder,
}) {
  final options = optionsBuilder();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: options.keys.map((optionsTitle) {
            final value = options[optionsTitle];
            //make it return an elevated button instead
            return GradientButton(
              label: optionsTitle,
              gradient: value == false
                  ? const LinearGradient(
                      colors: [primaryColor2, primaryColor1],
                    )
                  : const LinearGradient(
                      colors: [blackGradient, blackGradient],
                    ),
              onPressed: () {
                if (value != null) {
                  Navigator.of(context).pop(value);
                } else {
                  Navigator.of(context).pop();
                }
              },
              width: 70,
              height: 35,
            );
          }).toList(),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 25.0,
        );
      });
}
