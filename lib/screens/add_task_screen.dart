import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/models/task_models.dart';
import 'package:taskati/theme/texts_styles.dart';
import 'package:taskati/widgets/custom_textform_field.dart';
import 'package:taskati/widgets/custome_button.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }

  List<MaterialColor> taskColors = [
    Colors.purple,
    Colors.red,
    Colors.blue,
    Colors.pink,
  ];
  int activeColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Add Task",
          style: AppTextStyles().s22deepPurpleAccentWeight500,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 30,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TaskInputField(
                  label: "Title",
                  hint: "Enter title",
                  controller: _titleController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                TaskInputField(
                  label: "Description",
                  hint: "Enter description",
                  controller: _descriptionController,
                  maxLines: 4,
                  keyboardType: TextInputType.multiline,
                ),
                TaskInputField(
                  label: 'Date',
                  hint: '12/26/2025',
                  controller: _dateController,
                  // accentColor: primaryPurple,
                  readOnly: true,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2060),
                    ).then((value) {
                      _dateController.text = DateFormat.yMEd().format(
                        value ?? DateTime.now(),
                      );
                    });
                  },
                  suffixIcon: Icons.calendar_month_outlined,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TaskInputField(
                        readOnly: true,
                        label: "Start Time",
                        hint: "3:20 Am",
                        controller: _startTimeController,
                        suffixIcon: Icons.timer_outlined,
                        keyboardType: TextInputType.datetime,
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((value) {
                            _startTimeController.text =
                                value?.format(context).toString() ??
                                TimeOfDay.now().format(context);
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TaskInputField(
                        readOnly: true,
                        label: "End Time",
                        hint: "12:00 pm",
                        controller: _endTimeController,
                        suffixIcon: Icons.timer_outlined,
                        keyboardType: TextInputType.datetime,
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                            barrierDismissible: true,
                          ).then((value) {
                            _endTimeController.text =
                                value?.format(context).toString() ??
                                TimeOfDay.now().format(context);
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: List.generate(
                    taskColors.length,
                    (index) => InkWell(
                      onTap: () {
                        setState(() {
                          activeColorIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CircleAvatar(
                          backgroundColor: taskColors[index],
                          radius: 25,
                          child: activeColorIndex == index
                              ? const Icon(Icons.check, color: Colors.white)
                              : null,
                        ),
                      ),
                    ),
                  ),
                ),
                CustomButton(
                  text: "Create Task",
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      tasks.add(
                        TaskModel(
                          title: _titleController.text,
                          discription: _descriptionController.text,
                          date: _dateController.text,
                          startTime: _startTimeController.text,
                          endTime: _endTimeController.text,
                          status: 'TODO',
                          color: taskColors[activeColorIndex],
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
