import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/mealItem.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/categories-meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> dispalyedMeals;
  var didChange = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!didChange) {
      final routesArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routesArgs['title'];
      final mealsId = routesArgs['id'];
      dispalyedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(mealsId);
      }).toList();
      didChange = true;
    }

    super.didChangeDependencies();
  }

  void removeMeal(mealId) {
    setState(() {
      dispalyedMeals.removeWhere((meals) => meals.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
            //  removeMeal: removeMeal,
              id: dispalyedMeals[index].id,
              title: dispalyedMeals[index].title,
              imageUrl: dispalyedMeals[index].imageUrl,
              duration: dispalyedMeals[index].duration,
              complexity: dispalyedMeals[index].complexity,
              affordability: dispalyedMeals[index].affordability,
            );
          },
          itemCount: dispalyedMeals.length,
        ));
  }
}
