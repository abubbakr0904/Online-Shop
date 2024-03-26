
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qwerty/screens/home_screen/home_screen.dart';

import '../../view_models/tab_view_model.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Widget> screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[context.watch<TabViewModel>().getIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<TabViewModel>().getIndex,
        onTap: (newIndex) {
          context.read<TabViewModel>().changeIndex(newIndex);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Home",
            activeIcon: Icon(
              Icons.category,
              color: Colors.green,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outline_blank),
            label: "Categories",
            activeIcon: Icon(
              Icons.check_box_outline_blank,
              color: Colors.green,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Products",
            activeIcon: Icon(
              Icons.person,
              color: Colors.green,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            activeIcon: Icon(
              Icons.person,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
