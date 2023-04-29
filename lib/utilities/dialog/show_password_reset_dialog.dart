import 'package:crate_fire/utilities/dialog/generic_dialog.dart';
import 'package:flutter/material.dart';

Future<void> showPasswordResetSentDialog(
  BuildContext context,
  String title,
  String content,
) {
  return showGenericDialog(
      context: context,
      title: title,
      content: content,
      optionsBuilder: () => {
            'Ok': null,
          });
}
