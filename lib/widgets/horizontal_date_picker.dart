import 'package:flutter/material.dart';

class HorizontalDatePicker extends StatelessWidget {
  const HorizontalDatePicker({
    super.key,
    required this.onTap,
    required this.isSelected,
  });
  final bool isSelected;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isSelected ? Colors.deepPurpleAccent : Colors.white70,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                Text(
                  'oct',
                  style: isSelected
                      ? const TextStyle(color: Colors.white, fontSize: 19)
                      : const TextStyle(color: Colors.black, fontSize: 19),
                ),
                Text(
                  '30',
                  style: isSelected
                      ? const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        )
                      : const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                ),
                Text(
                  'Mon',
                  style: isSelected
                      ? const TextStyle(color: Colors.white, fontSize: 19)
                      : const TextStyle(color: Colors.black, fontSize: 19),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
