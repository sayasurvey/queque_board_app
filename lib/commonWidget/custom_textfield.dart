import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final FormFieldValidator<String>? validator;

  CustomTextField({
    required this.title,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(),
      ),
      validator: validator,
    );
  }
}
