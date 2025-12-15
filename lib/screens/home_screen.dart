import 'package:flutter/material.dart';
import 'package:taskati/widgets/days_of_date.dart';
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

class HomeScreenProfileName extends StatelessWidget {
  const HomeScreenProfileName({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Text(
            'Hi, Anas.\nHave a nice day',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          Spacer(),
          CircleAvatar(
            radius: 30,
            child: Image(image: AssetImage('assets/guts.jpg')),
          ),
        ],
      ),
    );
  }
}
