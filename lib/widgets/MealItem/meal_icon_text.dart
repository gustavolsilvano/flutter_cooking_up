import 'package:flutter/material.dart';

class MealIconText extends StatelessWidget {
  final String label;
  final IconData icon;
  const MealIconText({required this.label, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 6,
        ),
        Text(label)
      ],
    );
  }
}
