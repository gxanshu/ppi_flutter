import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ppi/components/primary_button.dart';
import 'package:ppi/components/select_box.dart';
import 'package:ppi/components/text_input.dart';
import 'package:ppi/components/image_picker.dart';
import 'package:ppi/utils/Loader.dart';
import 'package:ppi/utils/show_message.dart';

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

  File? _avatarImage;
  File? _aadharFrontImage;
  File? _aadharBackImage;
  String userType = "Member";

  void setAvatar(File? img) {
    setState(() {
      _avatarImage = img;
    });
  }

  void setFrontAadhar(File? img) {
    setState(() {
      _aadharFrontImage = img;
    });
  }

  void setBackAadhar(File? img) {
    setState(() {
      _aadharBackImage = img;
    });
  }

  void changeUserType(String type) {
    userType = type;
  }

  void registerUser(BuildContext context) async {
    // show progress bar
    showLoader(context);
    if (email.text.isEmpty ||
        password.text.isEmpty ||
        name.text.isEmpty ||
        fatherName.text.isEmpty ||
        email.text.isEmpty ||
        phoneNumber.text.isEmpty ||
        address.text.isEmpty ||
        _avatarImage == null ||
        _aadharFrontImage == null ||
        _aadharBackImage == null) {
      Navigator.pop(context);
      showMessage(context, "Something is missing, fill complete fileds");
    } else {
      try {
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email.text, password: password.text);
        // TODO: have to save data
        Navigator.pop(context);
      } on FirebaseException catch (e) {
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
              const SizedBox(height: 18),
              SelectBox(
                  value: "Member",
                  items: const ["Member", "Driver", "Associate"],
                  changeState: changeUserType),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.surfaceVariant,
                      ),
                      child: _aadharFrontImage == null
                          ? Center(
                              child: InkWell(
                                splashColor: Theme.of(context).colorScheme.secondaryContainer,
                                onTap: () {
                                  showSelectPhotoOptions(
                                      context, setFrontAadhar);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add_a_photo,
                                      size: 24,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "Aadhar Front",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurfaceVariant),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(10),
                              child: Stack(children: [
                                Image.file(_aadharFrontImage!),
                                Positioned(
                                    top: -10,
                                    right: -10,
                                    child: IconButton(
                                      onPressed: () => {
                                        setState(() {
                                          _aadharFrontImage = null;
                                        })
                                      },
                                      icon: const Icon(Icons.close),
                                    ))
                              ]),
                            ),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.surfaceVariant,
                      ),
                      child: _aadharBackImage == null
                          ? Center(
                              child: InkWell(
                                splashColor: Theme.of(context).colorScheme.secondaryContainer,
                                onTap: () {
                                  showSelectPhotoOptions(
                                      context, setBackAadhar);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add_a_photo,
                                      size: 24,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "Aadhar Back",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurfaceVariant),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(10),
                              child: Stack(children: [
                                Image.file(_aadharBackImage!),
                                Positioned(
                                    top: -10,
                                    right: -10,
                                    child: IconButton(
                                      onPressed: () => {
                                        setState(() {
                                          _aadharBackImage = null;
                                        })
                                      },
                                      icon: const Icon(Icons.close),
                                    ))
                              ]),
                            ),
                    ),
                  ))
                ],
              ),
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
                  registerUser(context);
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
