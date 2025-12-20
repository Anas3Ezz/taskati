import 'package:flutter/material.dart';

class UserGreetingHeader extends StatelessWidget {
  const UserGreetingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Hi,Anas\n',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                TextSpan(
                  text: 'Have A Nice Day.',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                ),
              ],
            ),
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
