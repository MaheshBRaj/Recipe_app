import 'package:flutter/material.dart';
import 'package:recipeapp/HomeScreen/data/data_source/recipe_service.dart';
import 'package:recipeapp/HomeScreen/data/models/products.dart';
import 'package:recipeapp/HomeScreen/presentation/widgets/recipecard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Recipes>> _futureRecipes;

  @override
  void initState() {
    super.initState();
    //calling the dummy api
    _futureRecipes = ApiService.fetchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recipe Carousel',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Recipes>>(
        future: _futureRecipes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            //CircularProgressIndicator this can be custimised according to design
            return Center(child: CircularProgressIndicator());
          if (snapshot.hasError)
            return Center(child: Text('Error: \${snapshot.error}'));

          final recipes = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ListView(
              // for horizontal scrolling or carousel
              scrollDirection: Axis.horizontal,

              //Using RecipeCard widget
              children:
                  recipes
                      .map((r) => Column(children: [RecipeCard(recipe: r)]))
                      .toList(),
            ),
          );
        },
      ),
    );
  }
}
