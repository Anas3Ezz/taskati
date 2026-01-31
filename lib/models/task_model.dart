import 'package:hive_flutter/adapters.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? discription;
  @HiveField(2)
  String? date;
  @HiveField(3)
  String? startTime;
  @HiveField(4)
  String? endTime;
  @HiveField(5)
  String? status;
  @HiveField(6)
  int color;
  TaskModel({
    required this.title,
    required this.discription,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.color,
  });
}

// List<TaskModel> tasks = [];
