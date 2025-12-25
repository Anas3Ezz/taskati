import 'package:flutter/material.dart';
import 'package:taskati/theme/texts_styles.dart';

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
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context);
    }
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
                  // --- Title Field ---
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
                    maxLines: 4, // Makes it taller for multi-line input
                    accentColor: primaryPurple,
                    keyboardType: TextInputType.multiline,
                  ),
                  const SizedBox(height: 16),
                  TaskInputField(
                    label: "Date",
                    hint: "Select Date",
                    controller: _dateController,
                    accentColor: primaryPurple,
                    readOnly: true, // Prevents keyboard popping up
                    suffixIcon: Icons.calendar_today_outlined,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TaskInputField(
                          label: "Start Time",
                          hint: "Select start",
                          controller: _startTimeController,
                          accentColor: primaryPurple,
                          readOnly: true,
                          suffixIcon: Icons.access_time,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TaskInputField(
                          label: "End Time",
                          hint: "Select end",
                          controller: _endTimeController,
                          accentColor: primaryPurple,
                          readOnly: true,
                          suffixIcon: Icons.access_time,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryPurple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Create Task",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ==========================================
// REUSABLE CUSTOM INPUT FIELD WIDGET
// ==========================================

class TaskInputField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final Color accentColor;
  final int maxLines;
  final bool readOnly;
  final IconData? suffixIcon;
  final VoidCallback? onTap;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const TaskInputField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.accentColor,
    this.maxLines = 1,
    this.readOnly = false,
    this.suffixIcon,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: accentColor, width: 1.5),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          readOnly: readOnly,
          onTap: onTap,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[500]),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(16),
            suffixIcon: suffixIcon != null
                ? Icon(suffixIcon, color: Colors.grey[600])
                : null,

            // Border states
            enabledBorder: borderStyle.copyWith(
              borderSide: BorderSide(
                color: accentColor.withOpacity(0.6),
                width: 1,
              ),
            ),
            focusedBorder: borderStyle.copyWith(
              borderSide: BorderSide(color: accentColor, width: 2),
            ),
            errorBorder: borderStyle.copyWith(
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: borderStyle.copyWith(
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
