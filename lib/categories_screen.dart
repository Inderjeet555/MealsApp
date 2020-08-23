import 'package:flutter/material.dart';
import './categoryItem.dart';
import './dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
          appBar: AppBar(title: const Text('DeliMeals'),),
          body: GridView(
            padding: const EdgeInsets.all(25),
          gridDelegate:
              SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,
              childAspectRatio: 3/2,
              crossAxisSpacing: 20,
               mainAxisSpacing: 20,),
               children:            
                DUMMY_CATEGORIES.
                map((cat) => CategoryItem(cat.title, cat.color)).toList()
              ,),
    );
  }
}
