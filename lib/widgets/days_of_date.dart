import 'package:flutter/material.dart';

class DaysOfDate extends StatelessWidget {
  const DaysOfDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.deepPurpleAccent,
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              Text('oct', style: TextStyle(color: Colors.white, fontSize: 19)),
              Text(
                '30',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text('Mon', style: TextStyle(color: Colors.white, fontSize: 19)),
            ],
          ),
        ),
      ),
    );
  }
}
