import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "परिवर्तन पार्टी ओफ़् इंडिया",
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        )),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
