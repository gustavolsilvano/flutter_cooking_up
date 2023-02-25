import 'package:flutter/material.dart';
import 'package:flutter_cooking_up/widgets/Drawer/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static String routeName = '/filters';
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      drawer: const MainDrawer(),
      body: const Text('Filters'),
    );
  }
}
