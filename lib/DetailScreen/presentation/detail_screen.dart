

import 'package:flutter/material.dart';
import 'package:recipeapp/HomeScreen/data/models/products.dart';



class DetailScreen extends StatelessWidget {
  final Recipes recipe;
  const DetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(recipe.name ?? 'Details')),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Currently Using network image need to change to cached image
          recipe.image != null
              ? Image.network(
                recipe.image!,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              )
              : Container(height: 250, color: Colors.grey),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.name ?? '',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Text(
                  'Ingredients:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                ...?recipe.ingredients?.map((ing) => Text('• \$ing')),
                SizedBox(height: 16),
                if (recipe.instructions != null) ...[
                  Text(
                    'Instructions:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  ...recipe.instructions!.map((step) => Text(step)),
                ],
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
