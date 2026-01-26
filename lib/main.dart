import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/models/user_model.dart';
import 'package:taskati/taskati.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>('user');
  runApp(const MyApp());
}
