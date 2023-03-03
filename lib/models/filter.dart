enum FilterTypeEnum {
  GlutenFree,
  LactoseFree,
  Vegeterian,
  Vegan,
}

class Filter {
  String label;
  String description;
  bool value;
  FilterTypeEnum type;
  String key;

  Filter(this.label, this.description, this.value, this.type, this.key);
}
