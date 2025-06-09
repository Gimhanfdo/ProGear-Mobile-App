// ignore_for_file: file_names

import 'package:flutter/material.dart';

// Implements a PreferredSizeWidget so that it can be used as an app bar
class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    //Access the current theme
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: theme.colorScheme.surface,
      elevation: 1, //Shadow
      title: Text(
        'PROGEAR',
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [ //Static notifications icon 
        IconButton(onPressed: (){}, icon: Icon(Icons.notifications))
      ],
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
