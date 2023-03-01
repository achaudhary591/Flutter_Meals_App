import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-details";

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => (meal.id == mealId));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            height: 200,
            width: 300,
            child: ListView.builder(
              itemCount: selectedMeal.ingredients.length,
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).colorScheme.secondary,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(
                    selectedMeal.ingredients[index],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
