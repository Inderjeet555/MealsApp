import 'package:flutter/material.dart';
import 'package:meals_App/models/meal.dart';
import '../widgets/mainn_drawer.dart';
import './categories_screen.dart';
import './favorites.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouritesMeal;

  TabsScreen(this.favouritesMeal);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPage = 0;

  @override
  initState() {
   _pages =  [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': Favorites(widget.favouritesMeal), 'title': 'Favorites'}
  ];
    super.initState();
  }

  

  void _selectedTab(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPage]['title'])),
      drawer: MainDrawer(),
      body: _pages[_selectedPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedTab,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPage,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text('Favorites')),
        ],
      ),
    );
  }
}

//Default Tabbar
//  Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(title: Text('Meal'),
//         bottom: TabBar(tabs: <Widget> [
//           Tab(icon: Icon(Icons.category), text: 'Categories',),
//           Tab(icon: Icon(Icons.star), text:  'Favorites',),
//         ]),),
//         body: TabBarView(children: <Widget>[
//           CategoriesScreen(), Favorites(),
//         ]),
//       ),
//     );
//   }
