import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);
  Widget buildListTitle(String title, IconData icon, tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            padding: const EdgeInsets.all((20)),
            alignment: Alignment.centerLeft,
            color: Colors.yellow,
            child: Text(
              'Cooking App',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTitle('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTitle('Settings', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
          // ListTile(
          //   leading: Icon(Icons.restaurant, size: 26),
          //   title: Text(
          //     'Meals',
          //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          //   ),
          //   onTap: () {
          //     //...
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.settings, size: 26),
          //   title: Text(
          //     'Settings',
          //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          //   ),
          //   onTap: () {
          //     //...
          //   },
          // ),
        ],
      ),
    );
  }
}
