import 'package:flutter/material.dart';

class UserDataInputField extends StatelessWidget {
  const UserDataInputField({
    super.key,
    required TextEditingController input,
    required this.hintText,
  }) : _input = input;

  final TextEditingController _input;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _input,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
