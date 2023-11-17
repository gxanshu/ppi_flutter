import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String placeholder;
  final bool hideText;
  final TextEditingController controller;
  final TextInputType type;

  const TextInput(
      {super.key,
      required this.placeholder,
      required this.hideText,
      required this.controller,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: hideText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        labelText: placeholder,
      ),
      keyboardType: type,
    );
  }
}
