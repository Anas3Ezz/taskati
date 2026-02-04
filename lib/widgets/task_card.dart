import 'package:flutter/material.dart';
import 'package:taskati/models/task_model.dart';
import 'package:taskati/theme/texts_styles.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({
    super.key,
    required this.tasks,
    required this.onDismissed,
  });
  final TaskModel tasks;
  final void Function(DismissDirection)? onDismissed;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        padding: const EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Icon(Icons.check_circle, color: Colors.white, size: 30),
      ),
      secondaryBackground: Container(
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Icon(Icons.delete, color: Colors.white, size: 30),
      ),
      onDismissed: onDismissed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(tasks.color),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
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
                      tasks.discription ?? 'c',
                      style: AppTextStyles().s22WhiteWeight500,
                    ),
                  ],
                ),
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
