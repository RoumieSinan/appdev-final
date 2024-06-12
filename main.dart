import 'package:flutter/material.dart';

void main() {
  runApp(RecipeRecommenderApp());
}

class RecipeRecommenderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Recommender',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final String correctUsername = 'testaccount';
  final String correctPassword = 'password123';

  void _login() {
    if (_usernameController.text == correctUsername &&
        _passwordController.text == correctPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Invalid username or password'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Login'),
              onPressed: _login,
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> favoriteRecipes = [];
  List<Map<String, dynamic>> recipes = [
    {
      'name': 'Pasta Primavera',
      'difficulty': 'Easy',
      'ingredients': ['Pasta', 'bell peppers', 'zucchini', 'tomatoes', 'garlic', 'olive oil', 'parmesan'],
      'dietary': 'Vegetarian',
    },
    {
      'name': 'Chicken Caesar Salad',
      'difficulty': 'Easy',
      'ingredients': ['Chicken breast', 'romaine lettuce', 'Caesar dressing', 'croutons', 'parmesan'],
      'dietary': 'None',
    },
    {
      'name': 'Beef Tacos',
      'difficulty': 'Easy',
      'ingredients': ['Ground beef', 'taco shells', 'lettuce', 'tomato', 'cheese', 'taco seasoning'],
      'dietary': 'None',
    },
    {
      'name': 'Vegetable Stir-Fry',
      'difficulty': 'Easy',
      'ingredients': ['Broccoli', 'bell peppers', 'snap peas', 'soy sauce', 'garlic', 'ginger'],
      'dietary': 'Vegan',
    },
    {
      'name': 'Quinoa Salad',
      'difficulty': 'Easy',
      'ingredients': ['Quinoa', 'cucumber', 'tomatoes', 'feta cheese', 'lemon juice', 'olive oil'],
      'dietary': 'Vegetarian',
    },
    {
      'name': 'Spaghetti Carbonara',
      'difficulty': 'Medium',
      'ingredients': ['Spaghetti', 'eggs', 'pancetta', 'parmesan', 'black pepper'],
      'dietary': 'None',
    },
    {
      'name': 'Shrimp Scampi',
      'difficulty': 'Medium',
      'ingredients': ['Shrimp', 'garlic', 'lemon', 'white wine', 'butter', 'parsley'],
      'dietary': 'None',
    },
    {
      'name': 'Mushroom Risotto',
      'difficulty': 'Medium',
      'ingredients': ['Arborio rice', 'mushrooms', 'vegetable broth', 'parmesan', 'onion', 'garlic'],
      'dietary': 'Vegetarian',
    },
    {
      'name': 'Chicken Alfredo',
      'difficulty': 'Medium',
      'ingredients': ['Chicken breast', 'fettuccine', 'heavy cream', 'parmesan', 'garlic'],
      'dietary': 'None',
    },
    {
      'name': 'Vegan Burrito',
      'difficulty': 'Medium',
      'ingredients': ['Tortilla', 'black beans', 'rice', 'avocado', 'salsa', 'corn', 'lettuce'],
      'dietary': 'Vegan',
    },
    {
      'name': 'Beef Stroganoff',
      'difficulty': 'Hard',
      'ingredients': ['Beef sirloin', 'mushrooms', 'onion', 'sour cream', 'beef broth', 'egg noodles'],
      'dietary': 'None',
    },
    {
      'name': 'Lamb Curry',
      'difficulty': 'Hard',
      'ingredients': ['Lamb', 'onions', 'tomatoes', 'curry spices', 'garlic', 'ginger', 'yogurt'],
      'dietary': 'None',
    },
    {
      'name': 'Eggplant Parmesan',
      'difficulty': 'Medium',
      'ingredients': ['Eggplant', 'marinara sauce', 'mozzarella', 'parmesan', 'breadcrumbs'],
      'dietary': 'Vegetarian',
    },
    {
      'name': 'Fish Tacos',
      'difficulty': 'Medium',
      'ingredients': ['White fish', 'taco shells', 'cabbage', 'lime', 'cilantro', 'avocado'],
      'dietary': 'None',
    },
    {
      'name': 'Tofu Stir-Fry',
      'difficulty': 'Easy',
      'ingredients': ['Tofu', 'broccoli', 'bell peppers', 'soy sauce', 'garlic', 'ginger'],
      'dietary': 'Vegan',
    },
    {
      'name': 'Stuffed Peppers',
      'difficulty': 'Medium',
      'ingredients': ['Bell peppers', 'ground beef', 'rice', 'tomatoes', 'cheese'],
      'dietary': 'None',
    },
    {
      'name': 'Chicken Marsala',
      'difficulty': 'Medium',
      'ingredients': ['Chicken breast', 'mushrooms', 'Marsala wine', 'garlic', 'butter'],
      'dietary': 'None',
    },
    {
      'name': 'Vegetarian Chili',
      'difficulty': 'Easy',
      'ingredients': ['Beans', 'tomatoes', 'bell peppers', 'onions', 'chili powder'],
      'dietary': 'Vegetarian',
    },
    {
      'name': 'Seafood Paella',
      'difficulty': 'Hard',
      'ingredients': ['Shrimp', 'mussels', 'clams', 'rice', 'saffron', 'bell peppers', 'peas'],
      'dietary': 'None',
    },
    {
      'name': 'Lentil Soup',
      'difficulty': 'Easy',
      'ingredients': ['Lentils', 'carrots', 'celery', 'onions', 'vegetable broth', 'garlic'],
      'dietary': 'Vegan',
    },
    {
      'name': 'Turkey Meatloaf',
      'difficulty': 'Medium',
      'ingredients': ['Ground turkey', 'breadcrumbs', 'onion', 'egg', 'ketchup'],
      'dietary': 'None',
    },
    {
      'name': 'Caprese Salad',
      'difficulty': 'Easy',
      'ingredients': ['Tomatoes', 'mozzarella', 'basil', 'olive oil', 'balsamic vinegar'],
      'dietary': 'Vegetarian',
    },
    {
      'name': 'Pork Tenderloin',
      'difficulty': 'Medium',
      'ingredients': ['Pork tenderloin', 'garlic', 'rosemary', 'olive oil'],
      'dietary': 'None',
    },
    {
      'name': 'Chocolate Cake',
      'difficulty': 'Hard',
      'ingredients': ['Flour', 'cocoa powder', 'sugar', 'eggs', 'butter', 'baking powder', 'milk'],
      'dietary': 'Vegetarian',
    },
  ];

  void toggleFavorite(String recipeName) {
    setState(() {
      if (favoriteRecipes.contains(recipeName)) {
        favoriteRecipes.remove(recipeName);
      } else {
        favoriteRecipes.add(recipeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Recipe Recommender'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Search'),
              Tab(text: 'Favorites'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            RecipeSearchPage(
              recipes: recipes,
              favoriteRecipes: favoriteRecipes,
              toggleFavorite: toggleFavorite,
            ),
            FavoritesPage(
              recipes: recipes,
              favoriteRecipes: favoriteRecipes,
              toggleFavorite: toggleFavorite,
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeSearchPage extends StatefulWidget {
  final List<Map<String, dynamic>> recipes;
  final List<String> favoriteRecipes;
  final Function(String) toggleFavorite;

  RecipeSearchPage({
    required this.recipes,
    required this.favoriteRecipes,
    required this.toggleFavorite,
  });

  @override
  _RecipeSearchPageState createState() => _RecipeSearchPageState();
}

class _RecipeSearchPageState extends State<RecipeSearchPage> {
  String searchQuery = '';
  String selectedDietary = 'All';
  String selectedDifficulty = 'All';

  List<Map<String, dynamic>> get filteredRecipes {
    return widget.recipes.where((recipe) {
      final matchesSearchQuery = searchQuery.isEmpty ||
          recipe['name']
              .toLowerCase()
              .contains(searchQuery.toLowerCase());
      final matchesDietary = selectedDietary == 'All' ||
          recipe['dietary'] == selectedDietary;
      final matchesDifficulty = selectedDifficulty == 'All' ||
          recipe['difficulty'] == selectedDifficulty;
      return matchesSearchQuery && matchesDietary && matchesDifficulty;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Search recipes',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectedDietary,
                  items: [
                    'All',
                    'None',
                    'Vegetarian',
                    'Vegan',
                  ].map((dietary) {
                    return DropdownMenuItem<String>(
                      value: dietary,
                      child: Text(dietary),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedDietary = value!;
                    });
                  },
                ),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectedDifficulty,
                  items: [
                    'All',
                    'Easy',
                    'Medium',
                    'Hard',
                  ].map((difficulty) {
                    return DropdownMenuItem<String>(
                      value: difficulty,
                      child: Text(difficulty),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedDifficulty = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredRecipes.length,
            itemBuilder: (context, index) {
              final recipe = filteredRecipes[index];
              final isFavorite = widget.favoriteRecipes.contains(recipe['name']);
              return ListTile(
                title: Text(recipe['name']),
                subtitle: Text('${recipe['difficulty']} • ${recipe['dietary']}'),
                trailing: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.star : Icons.star_border,
                    color: isFavorite ? Colors.yellow : null,
                  ),
                  onPressed: () {
                    widget.toggleFavorite(recipe['name']);
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeDetailPage(recipe: recipe),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class FavoritesPage extends StatelessWidget {
  final List<Map<String, dynamic>> recipes;
  final List<String> favoriteRecipes;
  final Function(String) toggleFavorite;

  FavoritesPage({
    required this.recipes,
    required this.favoriteRecipes,
    required this.toggleFavorite,
  });

  List<Map<String, dynamic>> getRecommendations(String dietary, String difficulty, List<String> favoriteIngredients) {
    return recipes.where((recipe) {
      final matchesDietary = dietary == 'All' || recipe['dietary'] == dietary;
      final matchesDifficulty = difficulty == 'All' || recipe['difficulty'] == difficulty;
      final matchesIngredients = recipe['ingredients'].any(favoriteIngredients.contains);
      final isNotFavorite = !favoriteRecipes.contains(recipe['name']);
      return matchesDietary && matchesDifficulty && matchesIngredients && isNotFavorite;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteRecipeList = recipes
        .where((recipe) => favoriteRecipes.contains(recipe['name']))
        .toList();

    if (favoriteRecipeList.isEmpty) {
      return Center(
        child: Text('No favorite recipes'),
      );
    }

    final favoriteRecipe = favoriteRecipeList.first;
    final dietary = favoriteRecipe['dietary'];
    final difficulty = favoriteRecipe['difficulty'];
    final favoriteIngredients = List<String>.from(favoriteRecipe['ingredients']);

    final recommendations = getRecommendations(dietary, difficulty, favoriteIngredients);

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: favoriteRecipeList.length,
            itemBuilder: (context, index) {
              final recipe = favoriteRecipeList[index];
              return ListTile(
                title: Text(recipe['name']),
                subtitle: Text('${recipe['difficulty']} • ${recipe['dietary']}'),
                trailing: IconButton(
                  icon: Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  onPressed: () {
                    toggleFavorite(recipe['name']);
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeDetailPage(recipe: recipe),
                    ),
                  );
                },
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Recommended Recipe'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: recommendations.map((recipe) {
                      return ListTile(
                        title: Text(recipe['name']),
                        subtitle: Text('${recipe['difficulty']} • ${recipe['dietary']}'),
                      );
                    }).toList(),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Close'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Recommend Recipe'),
        ),
      ],
    );
  }
}

class RecipeDetailPage extends StatelessWidget {
  final Map<String, dynamic> recipe;

  RecipeDetailPage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['name']),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Difficulty: ${recipe['difficulty']}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Dietary: ${recipe['dietary']}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Ingredients:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            for (var ingredient in recipe['ingredients'])
              Text(
                '• $ingredient',
                style: TextStyle(fontSize: 16.0),
              ),
            SizedBox(height: 20.0),
            Text(
              'Instructions:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            // Add your instructions here
            Text(
              '1. Placeholder for instruction 1',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '2. Placeholder for instruction 2',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
