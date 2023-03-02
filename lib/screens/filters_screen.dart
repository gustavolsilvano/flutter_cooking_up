import 'package:flutter/material.dart';
import 'package:flutter_cooking_up/models/filter.dart';
import 'package:flutter_cooking_up/widgets/Drawer/main_drawer.dart';
import 'package:flutter_cooking_up/widgets/Filter/filter.dart';

class FiltersScreen extends StatefulWidget {
  static String routeName = '/filters';
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  List<Filter> filters = [
    Filter('Gluten Free', 'Only include Gluten Free meals', false,
        FilterTypeEnum.GlutenFree),
    Filter('Vegetarian', 'Only include Vegeterian meals', false,
        FilterTypeEnum.Vegeterian),
    Filter('Vegan', 'Only include Vegan meals', false, FilterTypeEnum.Vegan),
    Filter('Lactose Free', 'Only include Lactose Free meals', false,
        FilterTypeEnum.LactoseFree),
  ];

  void _changeFilter(bool newValue, FilterTypeEnum type) {
    int filterIndex = filters.indexWhere((filter) => filter.type == type);
    setState(() {
      filters[filterIndex].value = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Your Filters')),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Adjust your meal selection.',
                  style: Theme.of(context).textTheme.titleSmall),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: filters
                    .map((filter) => FilterSwitch(filter, _changeFilter))
                    .toList(),
              ),
            )
          ],
        ));
  }
}
