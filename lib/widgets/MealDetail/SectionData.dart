import 'package:flutter/material.dart';

class SectionData extends StatelessWidget {
  final Widget child;

  const SectionData(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(12),
      height: 200,
      width: 300,
      child: child,
    );
  }
}
