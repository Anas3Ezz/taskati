import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/constant/app_strings.dart';
import 'package:taskati/models/task_model.dart';
import 'package:taskati/models/user_model.dart';
import 'package:taskati/screens/add_task_screen.dart';
import 'package:taskati/widgets/date_and_add_task_row.dart';
import 'package:taskati/widgets/date_status.dart';
import 'package:taskati/widgets/task_card.dart';
import 'package:taskati/widgets/user_greeting_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  UserModel? user = Hive.box<UserModel>('user').getAt(0);
  final List<String> categories = ['All', 'TODO', 'Complete'];
  List<TaskModel> tasks = [];
  @override
  Widget build(BuildContext context) {
    if (selectedIndex == 0) {
      tasks = Hive.box<TaskModel>(AppStrings.tasksBox).values.toList();
    } else if (selectedIndex == 1) {
      tasks = Hive.box<TaskModel>(AppStrings.tasksBox).values
          .toList()
          .where((e) => e.status?.toLowerCase() == 'todo')
          .toList();
    } else {
      tasks = Hive.box<TaskModel>(AppStrings.tasksBox).values
          .toList()
          .where((e) => e.status?.toLowerCase() == 'completed')
          .toList();
    }

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
                      UserGreetingHeader(user: user),
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

              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      categories.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: DateStatus(
                          selectedIndex: selectedIndex,
                          categories: categories,
                          index: index,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 30)),

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
                      itemBuilder: (context, index) => TaskCardWidget(
                        tasks: tasks[index],
                        onDismissed: (direction) {
                          if (direction == DismissDirection.startToEnd) {
                            updateTask(index);
                          } else {
                            deleteTask(index);
                          }
                        },
                      ),
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

  var myBox = Hive.box<TaskModel>(AppStrings.tasksBox);

  void deleteTask(int index) {
    myBox.deleteAt(index);
    setState(() {});
  }

  void updateTask(int index) {
    TaskModel? updateTask = myBox.getAt(index);
    updateTask?.status = 'Completed';
    updateTask?.save();
    setState(() {});
    // if (updateTask != null) {
    //   myBox.putAt(index, updateTask);
    //   setState(() {});
    // }
  }
}
