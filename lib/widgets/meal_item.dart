import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  MealItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.removeItem,
  });

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    ).then((result) {
      if(result != null) {
        removeItem(result);
      }
      print(result);
    });
  }

  String get complexityTest {
    if (complexity == Complexity.Simple) {
      return 'Simple';
    } else if (complexity == Complexity.Challenging) {
      return 'Challenging';
    }
    if (complexity == Complexity.Hard) {
      return 'Hard';
    }
    return 'Unknown Complexity';
  }

  String get affordabilityText {
    if (affordability == Affordability.Affordable) {
      return 'Affordable';
    } else if (affordability == Affordability.Luxurious) {
      return 'Luxurious';
    } else if (affordability == Affordability.Pricey) {
      return 'Pricey';
    }
    return 'Unknown Affordability';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('$duration'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.work,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(complexityTest),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.attach_money,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('$duration'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
