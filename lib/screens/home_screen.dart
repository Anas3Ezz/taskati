import 'package:flutter/material.dart';
import 'package:taskati/widgets/days_of_date.dart';
import 'package:taskati/widgets/home_screen_profile_name.dart';
import 'package:taskati/widgets/task_card.dart';
import 'package:taskati/widgets/todays_date.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeScreenProfileName(),
              SizedBox(height: 10),
              TodaysDate(),
              SizedBox(height: 20),
              Row(
                children: [
                  DaysOfDate(),
                  DaysOfDate(),
                  DaysOfDate(),
                  DaysOfDate(),
                ],
              ),
              SizedBox(height: 20),
              TaskCardWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
