import 'package:crate_fire/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

Future<void> showErrorDialog(BuildContext context, String text) {
  final theme = Theme.of(context).copyWith(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.purple,
    ),
  );
  return showDialog(
    context: context,
    builder: ((context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultPadding)),
        title: Text(
          'Sorry You\'ve encountered an error',
          style: theme.textTheme.bodyMedium,
        ),
        content: Text(
          text,
          style: theme.textTheme.bodySmall,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ok'),
          ),
        ],
      );
    }),
  );
}

Future<void> showErrDialog(BuildContext context, String text) {
  return QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    title: 'Sorry You\'ve encountered an error',
    text: text,
  );
}
