import 'package:flutter/material.dart';
import 'package:progear_app/screens/cart.dart';
import 'package:progear_app/screens/home.dart';
import 'package:progear_app/screens/products.dart';
import 'package:progear_app/screens/profile.dart';
import 'package:progear_app/screens/shared/bottomNavBar.dart';

class NavigationWrapper extends StatefulWidget {
  const NavigationWrapper({super.key});

  @override
  State<NavigationWrapper> createState() => _NavigationWrapperState();
}

class _NavigationWrapperState extends State<NavigationWrapper> {
  int currentIndex = 0;

  List<Widget> pages = [
    const Home(),
    const ProductsPage(),
    const CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
