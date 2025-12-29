import 'dart:ui';

class TaskModel {
  String? title;
  String? discription;
  String? date;
  String? startTime;
  String? endTime;
  String? status;
  Color color;
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

List<TaskModel> tasks = [];
