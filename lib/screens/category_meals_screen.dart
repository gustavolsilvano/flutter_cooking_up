import 'package:flutter/material.dart';
import 'package:flutter_cooking_up/dummy_data.dart';
import 'package:flutter_cooking_up/models/meal.dart';
import 'package:flutter_cooking_up/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  const CategoryMealsScreen({super.key});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (_loadedInitData) return;
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    categoryTitle = routeArgs['title'] ?? '';
    displayedMeals = DUMMY_MEALS.where((meal) {
      return meal.categoryIds.contains(categoryId);
    }).toList();
    _loadedInitData = true;
    super.didChangeDependencies();
  }

  void _removeItem(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle ?? ''),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) => MealItem(displayedMeals[index], _removeItem),
        itemCount: displayedMeals.length,
      ),
    );
  }
}
