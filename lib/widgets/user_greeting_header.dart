import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/constant/app_strings.dart';
import 'package:taskati/models/user_model.dart';
import 'package:taskati/screens/auth_screen.dart';
import 'package:taskati/theme/texts_styles.dart';

class UserGreetingHeader extends StatelessWidget {
  const UserGreetingHeader({super.key, required this.user});
  final UserModel? user;
  String formatDisplayName(String? name) {
    if (name == null || name.isEmpty) {
      return "?"; // Fallback character
    }
    return name[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Hi ${user?.name ?? ''}',
                  style: AppTextStyles().s22deepPurpleAccentWeight500,
                ),
                const TextSpan(
                  text: '\nHave A Nice Day.',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const Spacer(),
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.deepPurpleAccent,
            backgroundImage: (user?.image != null && user!.image.isNotEmpty)
                ? FileImage(File(user!.image))
                : null,
            child: (user?.image == null || user!.image.isEmpty)
                ? Text(
                    formatDisplayName(user?.name),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                : null,
          ),
          IconButton(
            onPressed: () {
              Hive.box<UserModel>(AppStrings.userBox).clear();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const AuthScreen()),
                (route) => false,
              );
            },
            icon: const Icon(Icons.key),
          ),
        ],
      ),
    );
  }
}
