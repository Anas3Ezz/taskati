import 'package:flutter/material.dart';

class TodaysDate extends StatelessWidget {
  const TodaysDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'December 14,2025\nToday',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                '+ Add Task',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
