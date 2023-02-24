import 'package:flutter/material.dart';
import 'package:flutter_cooking_up/screens/categories_screen.dart';
import 'package:flutter_cooking_up/screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        '/': (_) => const CategoriesScreen(),
        CategoryMealsScreen.routeName: (_) => const CategoryMealsScreen(),
      },
    );
  }
}
