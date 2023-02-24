import 'package:flutter/material.dart';
import 'package:flutter_cooking_up/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/category-meals/meal-detail';

  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: const Center(
        child: Text('Meal Detail'),
      ),
    );
  }
}
