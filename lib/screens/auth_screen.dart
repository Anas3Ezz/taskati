import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/widgets/custome_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
  XFile? photo;
  void pickPhotoFromCamera() async {
    photo = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  void pickPhotoFromGallery() async {
    photo = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: photo == null,
              replacement: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 80,
                backgroundImage: Image.file(File(photo?.path ?? "")).image,
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.black,
                radius: 80,
                child: Icon(Icons.person, size: 120),
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Pick an image from Camera',
              onTap: () {
                pickPhotoFromCamera();
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Pick an image from gallery',
              onTap: () {
                pickPhotoFromGallery();
              },
            ),
            const SizedBox(height: 18),
            const Divider(indent: 20, endIndent: 20),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: Color(0xFF5B6CFF), // blue border
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: Color(0xFF5B6CFF),
                        width: 2,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1.5,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Name is required';
                    }
                    if (value.trim().length < 3) {
                      return 'Name must be at least 3 characters';
                    }
                    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                      return 'Name can contain letters only';
                    }
                    return null; // valid
                  },
                ),
              ),
            ),
            CustomButton(
              text: 'Submit',
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  print('GOOD');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
