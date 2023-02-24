import 'package:flutter/material.dart';
import 'package:flutter_cooking_up/models/meal.dart';
import 'package:flutter_cooking_up/widgets/MealItem/meal_icon_text.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final ComplexityEnum complexity;
  final AffordabilityEnum affordability;

  void selectMeal() {}

  const MealItem(
      {required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability,
      super.key});

  String get complexityText {
    if (complexity == ComplexityEnum.Simple) return 'Simple';
    if (complexity == ComplexityEnum.Challenging) return 'Challenging';
    if (complexity == ComplexityEnum.Hard) return 'Hard';
    return 'Unknown';
  }

  String get affordabilityText {
    if (affordability == AffordabilityEnum.Affordable) return 'Affordable';
    if (affordability == AffordabilityEnum.Pricey) return 'Pricey';
    if (affordability == AffordabilityEnum.Luxurious) return 'Luxurious';
    return 'Unknown';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      imageUrl,
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
                        title,
                        style:
                            const TextStyle(fontSize: 26, color: Colors.white),
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
                      label: '$duration min',
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
          )),
    );
  }
}
