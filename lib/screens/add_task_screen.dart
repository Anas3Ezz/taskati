import 'package:flutter/material.dart';
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryPurple = Colors.indigoAccent.shade100;

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TaskInputField(
                    label: "Title",
                    hint: "Enter title",
                    controller: _titleController,
                    accentColor: primaryPurple,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TaskInputField(
                    label: "Description",
                    hint: "Enter description",
                    controller: _descriptionController,
                    maxLines: 4,
                    accentColor: primaryPurple,
                    keyboardType: TextInputType.multiline,
                  ),
                  const SizedBox(height: 16),
                  TaskInputField(
                    label: 'Date',
                    hint: '12/26/2025',
                    controller: _dateController,
                    accentColor: primaryPurple,
                    readOnly: true,
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2060),
                      ).then((value) {
                        _dateController.text = value.toString();
                      });
                    },
                    suffixIcon: Icons.calendar_month_outlined,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TaskInputField(
                          readOnly: true,
                          label: "Start Time",
                          hint: "3:20 Am",
                          controller: _startTimeController,
                          accentColor: primaryPurple,
                          keyboardType: TextInputType.datetime,
                          onTap: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {
                              _startTimeController.text =
                                  value?.format(context).toString() ?? '';
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: TaskInputField(
                          readOnly: true,
                          label: "End Time",
                          hint: "12:00 pm",
                          controller: _endTimeController,
                          accentColor: primaryPurple,
                          keyboardType: TextInputType.datetime,
                          onTap: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                              barrierDismissible: true,
                            ).then((value) {});
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CustomButton(text: "Create Task", onTap: _submitForm),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
