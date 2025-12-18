import 'package:flutter/material.dart';
import 'package:taskati/widgets/days_of_date.dart';
import 'package:taskati/widgets/home_screen_profile_name.dart';
import 'package:taskati/widgets/task_card.dart';
import 'package:taskati/widgets/todays_date.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              const HomeScreenProfileName(),
              const SizedBox(height: 10),
              const TodaysDate(),
              const SizedBox(height: 20),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => DaysOfDate(
                    isSelected: selectedIndex == index,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => const TaskCardWidget(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: 10,
              ),
              // const TaskCardWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
