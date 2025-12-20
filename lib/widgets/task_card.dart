import 'package:flutter/material.dart';
import 'package:taskati/theme/texts_styles.dart';

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  Text(
                    'Flutter Task-1',
                    style: AppTextStyles().s22WhiteWeight500,
                  ),
                  Text(
                    '02.45 Am -3.45 Am',
                    style: AppTextStyles().s20WhiteColor,
                  ),
                  Text(
                    'I will do this task',
                    style: AppTextStyles().s22WhiteWeight500,
                  ),
                ],
              ),
              const Spacer(),
              Container(width: 1, height: 85, color: Colors.white),
              const SizedBox(width: 10),
              RotatedBox(
                quarterTurns: 3,
                child: Text('TODO', style: AppTextStyles().s22WhiteWeight500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
