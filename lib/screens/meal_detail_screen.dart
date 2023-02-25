import 'package:flutter/material.dart';
import 'package:flutter_cooking_up/models/meal.dart';
import 'package:flutter_cooking_up/widgets/MealDetail/SectionData.dart';
import 'package:flutter_cooking_up/widgets/MealDetail/SectionTitle.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                const SectionTitle('Ingredients'),
                SectionData(ListView.builder(
                  itemBuilder: (_, index) => Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(meal.ingredients[index]),
                    ),
                  ),
                  itemCount: meal.ingredients.length,
                )),
                const SectionTitle('Steps'),
                SectionData(ListView.builder(
                  itemBuilder: (_, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(child: Text(('# ${index + 1}'))),
                        title: Text(meal.steps[index]),
                      ),
                      const Divider()
                    ],
                  ),
                  itemCount: meal.steps.length,
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
