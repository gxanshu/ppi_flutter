import 'package:flutter/material.dart';
import 'package:ppi/components/text_input.dart';

class FormTextInput extends TextInput {
  FormTextInput(
      {super.key,
      required super.placeholder,
      required super.hideText,
      required super.controller,
      required super.type});

  @override
  Widget build(context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      controller: super.controller,
      obscureText: super.hideText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        labelText: super.placeholder,
      ),
      keyboardType: super.type,
    );
  }
}
