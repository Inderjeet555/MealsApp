//import 'dart:ui';

import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meal.dart';
import './screens/filtersScreen.dart';
import './screens/meals_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouritesMeal = [];

  void _setFilters(Map<String, bool> filtersData) {
    setState(() {
      _filters = filtersData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }

        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }

        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }

        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourites(String id) {
    final existingIndex = _favouritesMeal.indexWhere((meal) => meal.id == id);
    //print(existingIndex);

    if (existingIndex >= 0) {
      setState(() {
        _favouritesMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouritesMeal
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
      });
    }
  }

  bool _isMealFavourite(String id) {
    return _favouritesMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline1: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      //home: CategoriesScreen(),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_favouritesMeal),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealsDetailScreen.routeName: (context) =>
            MealsDetailScreen(_toggleFavourites, _isMealFavourite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
