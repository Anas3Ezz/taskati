import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/models/task_models.dart';
import 'package:taskati/screens/add_task_screen.dart';
import 'package:taskati/widgets/date_and_add_task_row.dart';
import 'package:taskati/widgets/horizontal_date_picker.dart';
import 'package:taskati/widgets/task_card.dart';
import 'package:taskati/widgets/user_greeting_header.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const UserGreetingHeader(),
                      const SizedBox(height: 10),
                      DateAndAddTaskRow(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddTaskScreen(),
                            ),
                          );
                          setState(() {});
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: SizedBox(
                  height: 120,
                  child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => HorizontalDatePicker(
                      isSelected: selectedIndex == index,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 30)),
              // ... inside your slivers list:

              // 1. If tasks are empty, show the Lottie animation
              tasks.isEmpty
                  ? SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Lottie.asset('assets/images/noTasks.json'),
                          const Text("No tasks yet!"),
                        ],
                      ),
                    )
                  : SliverList.separated(
                      itemBuilder: (context, index) =>
                          TaskCardWidget(tasks: tasks[index]),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: tasks.length,
                    ),
              // Bottom padding
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
