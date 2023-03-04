import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  static const routeName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, ValueChanged updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MainDrawer(),
        appBar: AppBar(title: const Text('Filter')),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchListTile(
                    'Gluten-Free',
                    'Only include gluten-free meals.',
                    glutenFree,
                    (newValue) {
                      setState(() {
                        glutenFree = newValue;
                      });
                    },
                  ),
                  buildSwitchListTile(
                    'Lactose-Free',
                    'Only include lactose-free meals.',
                    lactoseFree,
                    (newValue) {
                      setState(() {
                        lactoseFree = newValue;
                      });
                    },
                  ),
                  buildSwitchListTile(
                    'Vegan',
                    'Only include Vegan meals.',
                    vegan,
                    (newValue) {
                      setState(() {
                        vegan = newValue;
                      });
                    },
                  ),
                  buildSwitchListTile(
                    'Vegetarian',
                    'Only include Vegetarian meals.',
                    vegetarian,
                    (newValue) {
                      setState(() {
                        vegetarian = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
