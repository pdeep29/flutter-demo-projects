import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favMeal;
  FavoriteScreen(this.favMeal);

  @override
  Widget build(BuildContext context) {
    if (favMeal.isEmpty) {
      return const Center(
        child: Text('You Have No Favriote '),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favMeal[index].id,
            title: favMeal[index].title,
            imageUrl: favMeal[index].imageUrl,
            duration: favMeal[index].duration,
            complexity: favMeal[index].complexity,
            affordability: favMeal[index].affordability,
          );
        },
        itemCount: favMeal.length,
      );
    }
    ;
  }
}
