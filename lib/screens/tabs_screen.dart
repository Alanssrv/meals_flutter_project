import 'package:flutter/material.dart';
import '../models/meal.dart';

import 'categories_screen.dart';
import 'favorite_screen.dart';
import '../components/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;

  const TabsScreen(this.favoriteMeal, {Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  late final List<Widget> _screens;

  final List<String> _titles = [
    'Lista de Categorias',
    'Meus Favoritos',
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    _screens = [
      const CategoriesScreen(),
      FavoriteScreen(widget.favoriteMeal),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _titles[_selectedScreenIndex],
        ),
      ),
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
