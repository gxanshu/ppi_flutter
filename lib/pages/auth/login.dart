import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ppi/components/primary_button.dart';
import 'package:ppi/components/text_input.dart';
import 'package:ppi/utils/Loader.dart';
import 'package:ppi/utils/show_message.dart';

class LoginScreen extends StatelessWidget {
  void Function() onTap;
  LoginScreen({super.key, required this.onTap});

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void loginUser(BuildContext context) async {
    showLoader(context);
    if (email.text.isEmpty || password.text.isEmpty) {
      Navigator.pop(context);
      showMessage(context, "Fill both fileds");
    } else {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.text, password: password.text);
        if(context.mounted) Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        showMessage(context, e.message!);
      }
    }
  }

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
              onPress: () {
                loginUser(context);
                },
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
