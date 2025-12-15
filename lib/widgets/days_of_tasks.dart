import 'package:flutter/material.dart';

class DaysOfTasks extends StatelessWidget {
  const DaysOfTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.deepPurpleAccent,
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: [
            Text('oct', style: TextStyle(color: Colors.white)),
            Text('30', style: TextStyle(color: Colors.white)),
            Text('Mon', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
