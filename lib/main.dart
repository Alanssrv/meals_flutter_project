import 'package:flutter/material.dart';

import 'screens/tabs_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'utils/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            headline1: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
            ),
            headline6: const TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w400,
            )),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => const TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (ctx) => const MealDetailScreen(),
      },
    );
  }
}
