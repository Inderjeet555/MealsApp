import 'package:flutter/material.dart';
import '../widgets/mainn_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filterScreen';

  final Map<String, bool> filters;
  final Function savetFilters;

  FiltersScreen(this.filters, this.savetFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.filters['gluten'];
    _lactoseFree = widget.filters['lactose'];
    _vegan = widget.filters['vegan'];
    _vegetarian = widget.filters['vegetarian'];
    super.initState();
  }

  Widget buildFilters(
      String title, String subtitle, Function setvalue, bool currentValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: setvalue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian
                  };
                  widget.savetFilters(selectedFilters);
                })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal Selection!',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildFilters(
                    'Gluten Free',
                    'Only include gluten-free meals.',
                    (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    },
                    _glutenFree,
                  ),
                  buildFilters(
                    'Vegetarian',
                    'Only include Vegetarian meals.',
                    (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    },
                    _vegetarian,
                  ),
                  buildFilters(
                    'Vegan',
                    'Only include Vegan meals.',
                    (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    },
                    _vegan,
                  ),
                  buildFilters(
                    'Lactose',
                    'Only include Lactose meals.',
                    (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    },
                    _lactoseFree,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
