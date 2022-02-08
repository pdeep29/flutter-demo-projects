import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String, bool> currentFliters;
  final Function saveFilters;
  FilterScreen(this.currentFliters, this.saveFilters);
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  void initState() {
    print(widget.currentFliters['glutenFree']);
    _glutenFree = widget.currentFliters['glutenFree'] as bool;
    _vegetarian = widget.currentFliters['vegetarian'] as bool;
    _vegan = widget.currentFliters['vegan'] as bool;
    _lactoseFree = widget.currentFliters['lactoseFree'] as bool;
    super.initState();
  }

  Widget _buildSwitchTile(
      String title, String desc, bool currentValue, updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(desc),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final sselectedFilters = {
                  'glutenFree': _glutenFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                  'lactoseFree': _lactoseFree,
                };
                widget.saveFilters(sselectedFilters);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: const Text('Adjust Your MEal Selection',
                style: TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1),
                    // fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchTile('Gluteen-Free',
                    'Onlu include Gluteen-free meals', _glutenFree, (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                }),
                _buildSwitchTile(
                    'Vegiterian', 'Only include Vegiterian meals', _vegetarian,
                    (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                }),
                _buildSwitchTile('Vegan', 'Onlu include Vegan meals', _vegan,
                    (value) {
                  setState(() {
                    _vegan = value;
                  });
                }),
                _buildSwitchTile('Lactose-Free',
                    'Onlu include Lactose-Free meals', _lactoseFree, (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                }),

                // SwitchListTile(
                //     title: Text('Gluteen-Free'),
                //     subtitle: Text('Onlu include gluteen-free meals '),
                //     value: _glutenFree,
                //     onChanged: (value) {
                //       setState(() {
                //         _glutenFree = value;
                //       });
                //     }),
              ],
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     widget.saveFilters;
      //   },
      //   child: Icon(Icons.delete),
      // ),
    );
  }
}
