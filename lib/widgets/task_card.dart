import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.deepPurpleAccent,
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  Text(
                    'Flutter Task-1',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '02.45 Am -3.45 Am',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Text(
                    'I will do this task',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              const Spacer(),
              Container(width: 1, height: 50, color: Colors.white),
              const SizedBox(width: 10),
              const RotatedBox(
                quarterTurns: 3,
                child: Text(
                  'TODO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
