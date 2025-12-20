import 'package:flutter/material.dart';
import 'package:taskati/theme/texts_styles.dart';

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
                      ? AppTextStyles().s20WhiteColor
                      : AppTextStyles().s20BlackColor,
                ),
                Text(
                  '30',
                  style: isSelected
                      ? AppTextStyles().s24WhiteColor500
                      : AppTextStyles().s24BlackColor500,
                ),
                Text(
                  'Mon',
                  style: isSelected
                      ? AppTextStyles().s20WhiteColor
                      : AppTextStyles().s20BlackColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
