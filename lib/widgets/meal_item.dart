import 'package:flutter/material.dart';
import 'package:flutter_cooking_up/models/meal.dart';
import 'package:flutter_cooking_up/screens/meal_detail_screen.dart';
import 'package:flutter_cooking_up/widgets/MealItem/meal_icon_text.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function? removeItem;
  final Function(Meal) toggleToFavorite;
  final bool isFavorite;

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(MealDetailScreen.routeName, arguments: meal)
        .then((value) {
      if (value != null && removeItem != null) {
        removeItem!(value);
      }
    });
  }

  const MealItem(
      this.meal, this.removeItem, this.toggleToFavorite, this.isFavorite,
      {super.key});

  String get complexityText {
    if (meal.complexity == ComplexityEnum.Simple) return 'Simple';
    if (meal.complexity == ComplexityEnum.Challenging) return 'Challenging';
    if (meal.complexity == ComplexityEnum.Hard) return 'Hard';
    return 'Unknown';
  }

  String get affordabilityText {
    if (meal.affordability == AffordabilityEnum.Affordable) return 'Affordable';
    if (meal.affordability == AffordabilityEnum.Pricey) return 'Pricey';
    if (meal.affordability == AffordabilityEnum.Luxurious) return 'Luxurious';
    return 'Unknown';
  }

  void handleLongPress() {
    toggleToFavorite(meal);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      onLongPress: handleLongPress,
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          margin: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    width: isFavorite ? 5 : 0, color: Colors.yellow)),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: Image.network(
                        meal.imageUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 0,
                      child: Container(
                        width: 300,
                        color: Colors.black54,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: Text(
                          meal.title,
                          style: const TextStyle(
                              fontSize: 26, color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MealIconText(
                        label: '${meal.duration} min',
                        icon: Icons.schedule,
                      ),
                      MealIconText(
                        label: complexityText,
                        icon: Icons.work,
                      ),
                      MealIconText(
                        label: affordabilityText,
                        icon: Icons.attach_money,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
