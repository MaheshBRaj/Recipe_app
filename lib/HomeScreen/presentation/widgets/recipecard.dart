import 'package:flutter/material.dart';
import 'package:recipeapp/DetailScreen/presentation/detail_screen.dart';
import 'package:recipeapp/HomeScreen/data/models/products.dart';

class RecipeCard extends StatelessWidget {
  final Recipes recipe;
  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    //adding three ingredients to string from list of ingredients items
    final keyIngredients = recipe.ingredients?.take(3).join(', ') ?? '';
    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            //currently using  MaterialPageRoute  need to implement autorouter
            MaterialPageRoute(builder: (_) => DetailScreen(recipe: recipe)),
          ),
      child: Container(
        width: 250,
        height: 250,

        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            //Giving boxshadow to better ui
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Using clipRreact to place the image
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                recipe.image ?? '',
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder:
                    (_, __, ___) => Container(color: Colors.grey, height: 120),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                recipe.name ?? 'No title',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                keyIngredients,
                style: TextStyle(color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
