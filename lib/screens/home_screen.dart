import 'package:flutter/material.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}

class DaysOfDate extends StatelessWidget {
  const DaysOfDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          // width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.deepPurpleAccent,
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                Text(
                  'oct',
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
                Text(
                  '30',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Mon',
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DaysOfTasks extends StatelessWidget {
  const DaysOfTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.deepPurpleAccent,
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: [
            Text('oct', style: TextStyle(color: Colors.white)),
            Text('30', style: TextStyle(color: Colors.white)),
            Text('Mon', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

class TodaysDate extends StatelessWidget {
  const TodaysDate({super.key});

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
      ],
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
