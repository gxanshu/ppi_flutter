import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ppi/components/primary_button.dart';
import 'package:ppi/components/text_input.dart';
import 'package:ppi/components/image_picker.dart';

class RegisterPage extends StatefulWidget {
  void Function() onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController fatherName = TextEditingController();

  TextEditingController phoneNumber = TextEditingController();

  TextEditingController address = TextEditingController();

  TextEditingController photo = TextEditingController();

  File? _avatarImage;
  File? _aadharFrontImage;
  File? _aadharBackImage;

  void setAvatar(File? img) {
    setState(() {
      _avatarImage = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 82),
              Stack(
                children: [
                  _avatarImage == null
                      ? const CircleAvatar(
                          radius: 42,
                          child: Icon(Icons.person, size: 28),
                        )
                      : CircleAvatar(
                          radius: 42,
                          backgroundImage: FileImage(_avatarImage!),
                        ),
                  Positioned(
                      bottom: -10,
                      right: -10,
                      child: IconButton(
                        onPressed: () =>
                            {showSelectPhotoOptions(context, setAvatar)},
                        icon: const Icon(Icons.add_a_photo),
                      ))
                ],
              ),
              const SizedBox(height: 18),
              const Text(
                "Create an account!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(height: 12),
              TextInput(
                  placeholder: "Name",
                  hideText: false,
                  controller: name,
                  type: TextInputType.text),
              const SizedBox(height: 12),
              TextInput(
                  placeholder: "Father's Name",
                  hideText: false,
                  controller: fatherName,
                  type: TextInputType.text),
              const SizedBox(height: 12),
              TextInput(
                  placeholder: "Phone Number",
                  hideText: false,
                  controller: phoneNumber,
                  type: TextInputType.number),
              const SizedBox(height: 12),
              TextInput(
                  placeholder: "Address",
                  hideText: false,
                  controller: address,
                  type: TextInputType.streetAddress),
              const SizedBox(height: 12),
              TextInput(
                  placeholder: "Email Address",
                  hideText: false,
                  controller: email,
                  type: TextInputType.emailAddress),
              const SizedBox(height: 12),
              TextInput(
                  placeholder: "Password",
                  hideText: true,
                  controller: password,
                  type: TextInputType.visiblePassword),
              const SizedBox(height: 18),
              PrimaryButton(
                text: "Register",
                onPress: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                },
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account ?"),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
