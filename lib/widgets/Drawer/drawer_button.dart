import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  VoidCallback onTap;
  final IconData icon;
  final String label;
  DrawerButton(this.onTap, this.icon, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }
}
