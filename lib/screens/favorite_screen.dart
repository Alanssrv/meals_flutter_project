import 'package:flutter/material.dart';

import '../components/meal_item.dart';
import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;

  const FavoriteScreen(this.favoriteMeal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return const Center(
        child: Text(
          'Nenhuma refeição marcada como favorita',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w300,
            fontFamily: 'Raleway',
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeal.length,
        itemBuilder: (ctx, index) => MealItem(favoriteMeal[index]),
      );
    }
  }
}
