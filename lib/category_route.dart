import 'package:flutter/material.dart';
import 'package:unit_converter/category.dart';
import 'package:unit_converter/unit.dart';

final _backgroundColor = Colors.yellowAccent[100];

class CategoriesRoute extends StatefulWidget {
  const CategoriesRoute({Key? key}) : super(key: key);

  @override
  _CategoriesRouteState createState() => _CategoriesRouteState();
}

class _CategoriesRouteState extends State<CategoriesRoute> {
  final _categories = <Category>[];
  static const _categoryNames = <String>[
    'Time',
    'Currency',
    'Digital Storage',
    'Energy',
    'Length',
    'Area',
    'Volume',
    'Mass',
  ];
  static const _baseColors = <Color>[
    Colors.purple,
    Colors.deepPurpleAccent,
    Colors.blue,
    Colors.green,
    Colors.pink,
    Colors.orange,
    Colors.red,
    Colors.grey,
  ];
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _categoryNames.length; i++) {
      _categories.add(Category(
        name: _categoryNames[i],
        color: _baseColors[i] as ColorSwatch<dynamic>,
        iconLocation: Icons.cake,
        units: _retrieveUnitList(_categoryNames[i]),
      ));
    }
  }

  Widget _buildCategoryWidgets() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => _categories[index],
      itemCount: _categories.length,
    );
  }

  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final listView = Container(
      color: _backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(),
    );
    final appBar = AppBar(
      elevation: 0.0,
      title: const Text(
        'Unit Converter',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
      centerTitle: true,
      backgroundColor: _backgroundColor,
    );
    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
