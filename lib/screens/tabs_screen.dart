import 'package:flutter/material.dart';
import 'package:flutter_cooking_up/models/meal.dart';
import 'package:flutter_cooking_up/screens/categories_screen.dart';
import 'package:flutter_cooking_up/screens/favorites_screen.dart';
import 'package:flutter_cooking_up/widgets/Drawer/main_drawer.dart';

class MainTab {
  final Widget page;
  final String title;

  MainTab(this.page, this.title);
}

class TabsScreen extends StatefulWidget {
  List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<MainTab> _pages = [];

  @override
  void initState() {
    _pages = [
      MainTab(const CategoriesScreen(), 'Categories'),
      MainTab(FavoritesScreen(widget.favoriteMeals), 'Your Favorites'),
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex].title),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex].page,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
              icon: const Icon(Icons.category), label: 'Categories'),
          const BottomNavigationBarItem(
              icon: const Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
