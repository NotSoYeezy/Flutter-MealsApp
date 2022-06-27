import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';

import '../dummy-data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  const CategoryMealsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = dummyMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var selectedMeal = categoryMeals[index];
          return MealItem(
            id: selectedMeal.id,
            title: selectedMeal.title,
            imageUrl: selectedMeal.imageUrl,
            duration: selectedMeal.duration,
            complexity: selectedMeal.complexity,
            affordability: selectedMeal.affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
