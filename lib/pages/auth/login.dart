import 'package:flutter/material.dart';
import 'package:ppi/components/primary_button.dart';
import 'package:ppi/components/text_input.dart';

class LoginScreen extends StatelessWidget {
  void Function() onTap;
  LoginScreen({super.key, required this.onTap});

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 32,
              child: Icon(
                Icons.groups,
                size: 32,
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              "Login to your account",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 18),
            TextInput(
                placeholder: "Email Address",
                hideText: false,
                controller: email,
                type: TextInputType.emailAddress),
            const SizedBox(height: 18),
            TextInput(
                placeholder: "Password",
                hideText: true,
                controller: password,
                type: TextInputType.visiblePassword),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text("Forget password?")],
            ),
            const SizedBox(height: 18),
            PrimaryButton(
              text: "Login",
              onPress: () {},
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have a account ?"),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: onTap,
                  child: const Text(
                    "Register now",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
