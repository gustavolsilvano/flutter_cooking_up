import 'package:flutter/material.dart';
import 'package:flutter_cooking_up/dummy_data.dart';
import 'package:flutter_cooking_up/models/filter.dart';
import 'package:flutter_cooking_up/models/meal.dart';
import 'package:flutter_cooking_up/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  List<Meal> favoriteMeals;
  List<Filter> filters;
  CategoryMealsScreen(this.filters, this.favoriteMeals, {super.key});

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
    Map<FilterTypeEnum, bool> filterMap = {};
    bool hasFilter = false;

    widget.filters.forEach((filter) {
      if (filter.value) hasFilter = true;
      filterMap[filter.type] = filter.value;
    });

    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    categoryTitle = routeArgs['title'] ?? '';
    displayedMeals = DUMMY_MEALS.where((meal) {
      if (!hasFilter) return meal.categoryIds.contains(categoryId);
      return meal.categoryIds.contains(categoryId) &&
          ((filterMap[FilterTypeEnum.isGlutenFree]! && meal.isGlutenFree) ||
              (filterMap[FilterTypeEnum.isVegan]! && meal.isVegan) ||
              (filterMap[FilterTypeEnum.isVegetarian]! && meal.isVegetarian) ||
              (filterMap[FilterTypeEnum.isLactoseFree]! && meal.isLactoseFree));
    }).toList();
    _loadedInitData = true;
    super.didChangeDependencies();
  }

  void _removeItem(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  void _toggleToFavorite(Meal meal) {
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
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          Meal currentMeal = displayedMeals[index];
          bool isFavorite =
              widget.favoriteMeals.any((meal) => meal.id == currentMeal.id);
          return MealItem(
              currentMeal, _removeItem, _toggleToFavorite, isFavorite);
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
