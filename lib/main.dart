import 'package:flutter/material.dart';
import 'package:progear_app/data/customerCart.dart';
import 'package:progear_app/screens/home.dart';
import 'package:progear_app/screens/login.dart';
import 'package:progear_app/screens/navigationWrapper.dart';
import 'package:progear_app/screens/register.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CustomerCart(),
    child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProGear',
      debugShowCheckedModeBanner: false, //Remove the debug label at the top
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Nunito',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Nunito',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),

      themeMode: ThemeMode.system,
      home: LoginScreen(),
    );
  }
}
