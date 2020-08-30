import 'package:flutter/material.dart';
import '../widgets/mealItem.dart';
import '../models/meal.dart';

class Favorites extends StatelessWidget {
  final List<Meal> favouritesMeal;

  Favorites(this.favouritesMeal);

  @override
  Widget build(BuildContext context) {
    if (favouritesMeal.isEmpty){
        return Center(
          child: Text('Favorites'),
        );
    }  
    else {
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(              
              id: favouritesMeal[index].id,
              title: favouritesMeal[index].title,
              imageUrl: favouritesMeal[index].imageUrl,
              duration: favouritesMeal[index].duration,
              complexity: favouritesMeal[index].complexity,
              affordability: favouritesMeal[index].affordability,
            );
          },
          itemCount: favouritesMeal.length,
        );
    }
  }
}
