import 'package:flutter/material.dart';
import '../models/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-details';
  final Function toggleFavriote;
  final Function isFavorite;
  MealDetailScreen(this.toggleFavriote, this.isFavorite);
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
            // fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
    );
  }

  Widget buildContainer(
    BuildContext context,
    Widget child,
  ) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.width * 0.5,
        width: MediaQuery.of(context).size.width * 1,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width * 0.7,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              context,
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (BuildContext context, int index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
              ),
            ),
            // Container(
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       border: Border.all(color: Colors.grey),
            //       borderRadius: BorderRadius.circular(10)),
            //   margin: EdgeInsets.all(10),
            //   padding: EdgeInsets.all(10),
            //   height: MediaQuery.of(context).size.width * 0.5,
            //   width: MediaQuery.of(context).size.width * 1,
            //   child: ListView.builder(
            //     itemCount: selectedMeal.ingredients.length,
            //     itemBuilder: (BuildContext context, int index) => Card(
            //       color: Theme.of(context).colorScheme.secondary,
            //       child: Padding(
            //         padding:
            //             const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            //         child: Text(selectedMeal.ingredients[index]),
            //       ),
            //     ),
            //   ),
            // ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              context,
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (BuildContext context, int index) =>
                    Column(children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${(index + 1)}'),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  Divider()
                ]),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavriote(mealID),
        child: isFavorite(mealID) == true
            ? Icon(Icons.star)
            : Icon(Icons.star_border),
      ),
    );
  }
}

// () {
          // Navigator.of(context).pop(mealID);
        // }