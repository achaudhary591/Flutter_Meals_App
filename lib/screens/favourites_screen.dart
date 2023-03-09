import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {

  final List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    if(favouriteMeals.isEmpty){
      return Center(
        child: Text(
          'You have no favourites yet - start adding some!',
        ),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeals![index].id,
            title: favouriteMeals![index].title,
            imageUrl: favouriteMeals![index].imageUrl,
            duration: favouriteMeals![index].duration,
            complexity: favouriteMeals![index].complexity,
            affordability: favouriteMeals![index].affordability,
          );
        },
        itemCount: favouriteMeals!.length,
      );
    }
  }
}
