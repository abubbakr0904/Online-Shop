import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qwerty/screens/home_screen/home_screen.dart';
import 'package:qwerty/screens/message_screen/message_screen.dart';
import 'package:qwerty/screens/produts_screen/product_screen.dart';
import 'package:qwerty/screens/profile_screen/profile_screen.dart';
import 'package:qwerty/utils/images/images.dart';
import '../../view_models/tab_view_model.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Widget> screens = [
    const HomeScreen(),
    const ProductsScreen(),
    const ProfileScreen(),
    const MessageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[context.watch<TabViewModel>().getIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<TabViewModel>().getIndex,
        fixedColor: const Color(0xFF6055D8),
        onTap: (newIndex) {
          context.read<TabViewModel>().changeIndex(newIndex);
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.home, color: Colors.grey),
            label: "Home",
            activeIcon: SvgPicture.asset(AppImages.home,
                color: const Color(0xFF6055D8)),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.products, color: Colors.grey),
            label: "Products",
            activeIcon: SvgPicture.asset(AppImages.products,
                color: const Color(0xFF6055D8)),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.profile, color: Colors.grey),
            label: "Profile",
            activeIcon: SvgPicture.asset(AppImages.profile,
                color: const Color(0xFF6055D8)),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.news, color: Colors.grey),
            label: "News",
            activeIcon: SvgPicture.asset(AppImages.news,
                color: const Color(0xFF6055D8)),
          )
        ],
      ),
    );
  }
}
