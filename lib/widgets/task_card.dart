import 'package:flutter/material.dart';
import 'package:taskati/models/task_models.dart';
import 'package:taskati/theme/texts_styles.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({super.key, required this.tasks});
  final TaskModel tasks;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: tasks.color,
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
                    tasks.title ?? 'No title',
                    style: AppTextStyles().s22WhiteWeight500,
                  ),
                  Text(
                    '${tasks.date} - ${tasks.endTime}',
                    style: AppTextStyles().s20WhiteColor,
                  ),
                  Text(
                    tasks.discription ?? 'NNOOOOOO Disc',
                    style: AppTextStyles().s22WhiteWeight500,
                  ),
                ],
              ),
              const Spacer(),
              Container(width: 1, height: 85, color: Colors.white),
              const SizedBox(width: 10),
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  tasks.status ?? 'TODO',
                  style: AppTextStyles().s22WhiteWeight500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
