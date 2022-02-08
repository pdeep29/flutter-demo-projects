import 'package:flutter/material.dart';
import 'package:meals/models/dummy_data.dart';
import '../screens/filter_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/category_meals_screen.dart';

import '../screens/meal_details_screen.dart';
import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  late Map<String, bool> filters = {
    'glutenFree': false,
    'vegetarian': false,
    'vegan': false,
    'lactoseFree': false,
  };
  List<Meal> _avilableMeals = DUMMY_MEALS;
  List<Meal> favrioteMeals = [];

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      _avilableMeals = DUMMY_MEALS.where((meals) {
        if (filters['glutenFree'] as bool && !meals.isGlutenFree) {
          return false;
        }
        if (filters['vegetarian'] as bool && !meals.isVegetarian) {
          return false;
        }
        if (filters['vegan'] as bool && !meals.isVegan) {
          return false;
        }
        if (filters['lactoseFree'] as bool && !meals.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();

      print(filters);
    });
  }

  void toggleFavorite(String mealID) {
    final existingIndex =
        favrioteMeals.indexWhere((element) => element.id == mealID);
    print(existingIndex);
    if (existingIndex >= 0) {
      print('existingIndex >= 0');
      setState(() {
        favrioteMeals
            .remove(DUMMY_MEALS.firstWhere((element) => element.id == mealID));
      });
    } else {
      print('existingIndex >= 0 else');
      setState(() {
        favrioteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealID));
      });
    }
  }

  bool isMealFavorite(String id) {
    return favrioteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MEALS',
      theme: ThemeData(
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          // fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                headline6: const TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1),
                    // fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Colors.amber)),
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(favrioteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_avilableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(toggleFavorite, isMealFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen(filters, setFilters),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
    );
  }
}
