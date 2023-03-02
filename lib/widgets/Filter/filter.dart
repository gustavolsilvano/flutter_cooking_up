import 'package:flutter/material.dart';
import 'package:flutter_cooking_up/models/filter.dart';

class FilterSwitch extends StatelessWidget {
  Filter filter;
  final Function(bool newValue, FilterTypeEnum filterType) _changeFilter;

  FilterSwitch(this.filter, this._changeFilter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              filter.label,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              filter.description,
            ),
          ],
        ),
        Switch(
            value: filter.value,
            onChanged: (newValue) => _changeFilter(newValue, filter.type)),
      ],
    );
  }
}
