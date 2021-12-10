import 'package:flutter/material.dart';
import 'package:unit_converter/category_route.dart';

void main() {
  runApp(UnitConverter());
}

class UnitConverter extends StatelessWidget {
  const UnitConverter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoriesRoute(),
    );
  }
}
