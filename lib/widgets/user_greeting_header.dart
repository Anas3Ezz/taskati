import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/models/user_model.dart';
import 'package:taskati/theme/texts_styles.dart';

class UserGreetingHeader extends StatelessWidget {
  const UserGreetingHeader({super.key, required this.user});
  final UserModel? user;
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
                  text: 'Hi,${user?.name ?? ''}',
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
            backgroundImage: Image.file(File(user?.image ?? '')).image,
          ),
        ],
      ),
    );
  }
}
