import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final void Function() onPress;
  final String text;
  const PrimaryButton({super.key, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPress,
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        //textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      child: Text(text),
    );
  }
}
