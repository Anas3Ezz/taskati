import 'package:flutter/material.dart';
import 'package:taskati/theme/texts_styles.dart';

class UserGreetingHeader extends StatelessWidget {
  const UserGreetingHeader({super.key});

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
                  text: 'Hi,Anas\n',
                  style: AppTextStyles().s22deepPurpleAccentWeight500,
                ),
                const TextSpan(
                  text: 'Have A Nice Day.',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const Spacer(),
          const CircleAvatar(
            radius: 30,
            child: Image(image: AssetImage('assets/guts.jpg')),
          ),
        ],
      ),
    );
  }
}
