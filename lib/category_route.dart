import 'package:flutter/material.dart';
import 'package:unit_converter/Category.dart';

final _backgroundColor = Colors.yellowAccent[100];

class CategoriesRoute extends StatelessWidget {
  const CategoriesRoute({Key? key}) : super(key: key);
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

  Widget _buildCategoryWidgets(List<Widget> categories) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categories[index],
      itemCount: categories.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = <Category>[];
    for (var i = 0; i < _categoryNames.length; i++) {
      categories.add(Category(
        name: _categoryNames[i],
        color: _baseColors[i] as ColorSwatch<dynamic>,
        iconLocation: Icons.cake,
      ));
    }
    final listView = Container(
      color: _backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(categories),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _backgroundColor,
        elevation: 0.0,
        title: Center(
          child: Text(
            'Unit Converter',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: listView,
    );
  }
}
