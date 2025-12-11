import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? photo;
  // // Pick an image.
  // final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  // Capture a photo.
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
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 80,
                child: Icon(Icons.person, size: 120),
              ),
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Pick an image form Camera',
              onTap: () {
                pickPhotoFromCamera();
              },
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Pick an image form gallery',
              onTap: () {
                pickPhotoFromGallery();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: const Color(0xFF4850F0),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
