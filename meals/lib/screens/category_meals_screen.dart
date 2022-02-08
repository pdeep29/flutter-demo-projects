import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import '../widgets/meal_item.dart';
import '../models/dummy_data.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/categories-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);
  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // final String CategoryId;
  dynamic Categorytitle;
  late List<Meal> displayedMeals;

  bool loadedInitData = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!loadedInitData) {
      final routeDetails =
          ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
      Categorytitle = routeDetails['title'];
      final CategoryId = routeDetails['id'];
      final categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(CategoryId);
      }).toList();
      displayedMeals = categoryMeals;
      print(categoryMeals);
      loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void removeMeal(String mealID) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealID);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(Categorytitle);
    return Scaffold(
      appBar: AppBar(
        title: Text(Categorytitle.toString()),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            // removeItem: null,
            // removeItem: removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
