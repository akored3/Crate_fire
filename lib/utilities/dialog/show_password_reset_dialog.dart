import 'package:crate_fire/utilities/dialog/generic_dialog.dart';
import 'package:flutter/material.dart';

Future<void> showPasswordResetSentDialog(
  BuildContext context,
) {
  return showGenericDialog(
      context: context,
      title: 'Password Reset',
      content: 'Reset link has been sent to your email',
      optionsBuilder: () => {
            'Ok': null,
          });
}
