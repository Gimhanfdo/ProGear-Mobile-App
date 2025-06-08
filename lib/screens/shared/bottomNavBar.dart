import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged <int> onTap;

  const BottomNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return NavigationBar(
      onDestinationSelected: onTap,
      selectedIndex: currentIndex,
      backgroundColor: theme.colorScheme.surfaceContainer,
      indicatorColor: theme.colorScheme.primary.withOpacity(0.2),
      indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home_filled),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.shopping_bag_outlined),
          selectedIcon: Icon(Icons.shopping_bag),
          label: 'Products',
        ),
        NavigationDestination(
          icon: Icon(Icons.shopping_cart_outlined),
          selectedIcon: Icon(Icons.shopping_cart),
          label: 'My Cart',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outlined),
          selectedIcon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
