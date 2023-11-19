import 'package:flutter/material.dart';
import 'package:ppi/components/news_card.dart';

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
      body: const SingleChildScrollView(
        child: Column(
          children: [NewsCard(), NewsCard(), NewsCard()],
        ),
      ),
    );
  }
}
