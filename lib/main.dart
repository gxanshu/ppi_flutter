import 'package:flutter/material.dart';
import 'package:ppi/pages/auth/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorSchemeSeed: Colors.orange,
          useMaterial3: true,
          textTheme: const TextTheme(
            displaySmall: TextStyle(fontFamily: "Noto Sans", letterSpacing: 0.9),
            displayMedium: TextStyle(fontFamily: "Noto Sans", letterSpacing: 0.9),
            displayLarge: TextStyle(fontFamily: "Noto Sans", letterSpacing: 0.9),
          )),
      home: const LoginOrRegister(),
    );
  }
}
