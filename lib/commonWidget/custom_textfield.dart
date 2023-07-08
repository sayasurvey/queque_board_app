import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;

  CustomTextField({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(),
      ),
    );
  }
}
