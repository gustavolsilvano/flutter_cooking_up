import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  static String routeName = '/filters';
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      body: const Text('Filters'),
    );
  }
}
