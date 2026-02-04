import 'package:flutter/material.dart';

class DateStatus extends StatelessWidget {
  const DateStatus({
    super.key,
    required this.selectedIndex,
    required this.categories,
    required this.index,
  });

  final int selectedIndex;
  final int index;
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: selectedIndex == index
            ? Colors.deepPurpleAccent
            : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        categories[index],
        style: TextStyle(
          color: selectedIndex == index ? Colors.white : Colors.black54,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
    );
  }
}
