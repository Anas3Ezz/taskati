import 'package:flutter/material.dart';

class DateAndAddTaskRow extends StatelessWidget {
  const DateAndAddTaskRow({super.key, this.onTap});
  final void Function()? onTap;
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
          child: InkWell(
            onTap: onTap,
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
        ),
      ],
    );
  }
}
