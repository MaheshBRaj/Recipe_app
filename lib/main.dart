import 'package:flutter/material.dart';
import 'package:recipeapp/HomeScreen/presentation/home_screen.dart';

void main() {
  //Run the main app
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Explorer',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),

      //to remove the debug check in the main screen
      debugShowCheckedModeBanner: false,
    );
  }
}
