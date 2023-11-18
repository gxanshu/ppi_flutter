import 'package:flutter/material.dart';

void showLoader(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ));
}
