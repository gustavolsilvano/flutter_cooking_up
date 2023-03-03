import 'package:flutter/material.dart';
import 'package:flutter_cooking_up/models/meal.dart';
import 'package:flutter_cooking_up/widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals, {super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  void _toggleFavorite(Meal meal) {
    setState(() {
      if (widget.favoriteMeals.any((mealInt) => mealInt.id == meal.id)) {
        return widget.favoriteMeals
            .removeWhere((mealInt) => mealInt.id == meal.id);
      }
      return widget.favoriteMeals.add(meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.favoriteMeals.isEmpty
          ? const Center(
              child: Text('No favorites yet. Start adding some!'),
            )
          : ListView.builder(
              itemBuilder: (_, index) => MealItem(
                  widget.favoriteMeals[index], null, _toggleFavorite, true),
              itemCount: widget.favoriteMeals.length,
            ),
    );
  }
}
