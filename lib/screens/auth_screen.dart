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
              text: 'Pick an image form Camera',
              onTap: () {
                pickPhotoFromCamera();
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Pick an image form gallery',
              onTap: () {
                pickPhotoFromGallery();
              },
            ),
            const SizedBox(height: 18),
            const Divider(indent: 20, endIndent: 20),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                enabled: true,

                decoration: InputDecoration(
                  hint: const Text('Enter your name'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
