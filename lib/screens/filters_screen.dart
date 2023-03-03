import 'package:flutter/material.dart';
import 'package:flutter_cooking_up/models/filter.dart';
import 'package:flutter_cooking_up/widgets/Drawer/main_drawer.dart';
import 'package:flutter_cooking_up/widgets/Filter/filter.dart';

class FiltersScreen extends StatefulWidget {
  static String routeName = '/filters';
  final List<Filter> filters;
  final Function(BuildContext) setFilters;

  const FiltersScreen(this.filters, this.setFilters, {super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late Function(BuildContext) _setFilters;

  void _changeFilter(bool newValue, FilterTypeEnum type) {
    int filterIndex =
        widget.filters.indexWhere((filter) => filter.type == type);
    setState(() {
      widget.filters[filterIndex].value = newValue;
    });
  }

  @override
  void initState() {
    super.initState();
    _setFilters = widget.setFilters;
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
                children: widget.filters
                    .map((filter) => FilterSwitch(filter, _changeFilter))
                    .toList(),
              ),
            ),
            ElevatedButton(
                onPressed: () => _setFilters(context),
                child: const Text('Save Filters'))
          ],
        ));
  }
}
