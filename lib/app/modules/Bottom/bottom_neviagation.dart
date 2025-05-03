import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../category/view/category.dart';
import '../favorites/views/favorites_view.dart';
import '../products/view/products.dart';
import '../profile/views/profile_view.dart';

class BottomNevagation extends StatefulWidget {
  const BottomNevagation({super.key});

  @override
  State<BottomNevagation> createState() => _BottomNevagationState();
}

class _BottomNevagationState extends State<BottomNevagation> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    ProductScreen(callFrom: '/products?limit=100',),
    CategoriesScreen(),
    FavoritesScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {


    return WillPopScope(
      onWillPop: () async {
        // Show confirmation dialog before exiting
        bool shouldExit = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Exit App"),
            content: const Text("Are you sure you want to exit the app?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text("Exit"),
              ),
            ],
          ),
        );

        return shouldExit;
      },
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Products'),
              BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourites'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My Setting'),
            ],
            currentIndex: _currentIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }

}