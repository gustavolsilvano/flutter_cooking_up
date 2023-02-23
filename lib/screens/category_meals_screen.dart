import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_cooking_up/dummy_data.dart';
import 'package:flutter_cooking_up/models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];

    final List<Meal> meals = DUMMY_MEALS.where((meal) {
      return meal.categoryIds.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle != null ? categoryTitle : ''),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) => Text(meals[index].title),
        itemCount: meals.length,
      ),
    );
  }
}