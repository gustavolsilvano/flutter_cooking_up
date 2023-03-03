import 'package:flutter/material.dart';
import 'package:flutter_cooking_up/models/filter.dart';
import 'package:flutter_cooking_up/screens/categories_screen.dart';
import 'package:flutter_cooking_up/screens/category_meals_screen.dart';
import 'package:flutter_cooking_up/screens/filters_screen.dart';
import 'package:flutter_cooking_up/screens/meal_detail_screen.dart';
import 'package:flutter_cooking_up/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Filter> filters = [
    Filter('Gluten Free', 'Only include Gluten Free meals', false,
        FilterTypeEnum.GlutenFree, 'isGlutenFree'),
    Filter('Vegetarian', 'Only include Vegeterian meals', false,
        FilterTypeEnum.Vegeterian, 'isVegetarian'),
    Filter('Vegan', 'Only include Vegan meals', false, FilterTypeEnum.Vegan,
        'isVegan'),
    Filter('Lactose Free', 'Only include Lactose Free meals', false,
        FilterTypeEnum.LactoseFree, 'isLactoseFree'),
  ];

  void _setFilters(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodySmall: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            titleSmall: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold)));

    return MaterialApp(
      title: 'DeliMeals',
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(secondary: Colors.amber)),
      routes: {
        '/': (_) => const TabsScreen(),
        CategoryMealsScreen.routeName: (_) => CategoryMealsScreen(filters),
        MealDetailScreen.routeName: (_) => const MealDetailScreen(),
        FiltersScreen.routeName: (_) => FiltersScreen(filters, _setFilters)
      },
      onUnknownRoute: ((settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      }),
    );
  }
}
