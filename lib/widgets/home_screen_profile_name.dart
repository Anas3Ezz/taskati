import 'package:flutter/material.dart';

class HomeScreenProfileName extends StatelessWidget {
  const HomeScreenProfileName({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Text(
            'Hi, Anas.\nHave a nice day',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          Spacer(),
          CircleAvatar(
            radius: 30,
            child: Image(image: AssetImage('assets/guts.jpg')),
          ),
        ],
      ),
    );
  }
}
