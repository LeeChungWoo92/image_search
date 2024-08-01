import 'package:flutter/material.dart';

import '../../domain/model/recipe.dart';

class SearchRecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const SearchRecipeDetailScreen({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Hero(
            tag: recipe.largeImageURL,
            child: Image.network(recipe.largeImageURL),
          ),
          const SizedBox(height: 20),
          Text(
            'user: ${recipe.user}',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            'tags: ${recipe.tags}',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
