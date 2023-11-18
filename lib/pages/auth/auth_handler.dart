import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ppi/pages/auth/main.dart';
import 'package:ppi/pages/dashboard/main.dart';

class AuthHandler extends StatelessWidget {
  const AuthHandler({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
        	if(snapshot.hasData){
        		return const Dashboard();
        	} else {
        		return const LoginOrRegister();
        	}
        },
      ),
    );
  }
}
