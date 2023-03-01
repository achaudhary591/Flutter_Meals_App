import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal-App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // useMaterial3: true,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(
          secondary: Colors.amber,
        ),
      ),
      darkTheme: ThemeData.dark(/*useMaterial3: true*/),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => const CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        /*return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );*/
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
