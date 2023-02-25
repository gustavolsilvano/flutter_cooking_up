import 'package:flutter/material.dart';
import 'package:flutter_cooking_up/screens/filters_screen.dart';
import 'package:flutter_cooking_up/screens/tabs_screen.dart';
import 'package:flutter_cooking_up/widgets/Drawer/drawer_button.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  void onTapMeals(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed('/');
  }

  void onTapSettings(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(FiltersScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).colorScheme.secondary,
          child: Text(
            'Cooking Up!',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        DrawerButton(() => onTapMeals(context), Icons.restaurant, 'Meals'),
        DrawerButton(() => onTapSettings(context), Icons.settings, 'Filters')
      ],
    ));
  }
}
