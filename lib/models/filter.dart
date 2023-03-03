enum FilterTypeEnum {
  isGlutenFree,
  isLactoseFree,
  isVegetarian,
  isVegan,
}

class Filter {
  String label;
  String description;
  bool value;
  FilterTypeEnum type;

  Filter(this.label, this.description, this.value, this.type);
}
