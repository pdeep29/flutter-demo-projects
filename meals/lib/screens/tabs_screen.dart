import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import '../screens/favorite_screen.dart';
import '../screens/categories_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> faviroite;
  TabsScreen(this.faviroite);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Widget> _pages;

  int _selectedPageIndex = 0;
  @override
  void initState() {
    _pages = [
      CategoriesScreen(),
      FavoriteScreen(widget.faviroite),
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.faviroite);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
        // ignore: prefer_const_literals_to_create_immutables
        // bottom: const TabBar(
        //   tabs: <Widget>[
        //     Tab(
        //       icon: Icon(Icons.category),
        //       text: 'Categories',
        //     ),
        //     Tab(
        //       icon: Icon(
        //         Icons.star,
        //       ),
        //       text: 'Favourates',
        //     ),
        //   ],
        // ),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: _pages.elementAt(_selectedPageIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorite',
          )
        ],
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
      ),
    );
  }
}

// return DefaultTabController(
//       length: 2,
//       initialIndex: 0,
//       child: Scaffold(
//           appBar: AppBar(
//             title: Text('Meals'),
//             // ignore: prefer_const_literals_to_create_immutables
//             bottom: const TabBar(
//               tabs: <Widget>[
//                 Tab(
//                   icon: Icon(Icons.category),
//                   text: 'Categories',
//                 ),
//                 Tab(
//                   icon: Icon(
//                     Icons.star,
//                   ),
//                   text: 'Favourates',
//                 ),
//               ],
//             ),
//           ),
//           body: TabBarView(
//               children: <Widget>[CategoriesScreen(), FavoriteScreen()])),
//     );
//   }
// }

//  return Scaffold(
//       appBar: AppBar(
//         title: const Text('Meals'),
//         // ignore: prefer_const_literals_to_create_immutables
//         bottom: const TabBar(
//           tabs: <Widget>[
//             Tab(
//               icon: Icon(Icons.category),
//               text: 'Categories',
//             ),
//             Tab(
//               icon: Icon(
//                 Icons.star,
//               ),
//               text: 'Favourates',
//             ),
//           ],
//         ),
//       ),
//       body: Center(
//         child: _pages.elementAt(_selectedPageIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         // backgroundColor: Theme.of(context).primaryColor,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.category),
//             label: 'Category',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.star),
//             label: 'Favorite',
//           )
//         ],
//         currentIndex: _selectedPageIndex,
//         onTap: _selectPage,
//       ),
//     );
//   }
// }
