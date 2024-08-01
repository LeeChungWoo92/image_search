import 'package:flutter/material.dart';

import '../../domain/model/recipe.dart';

class RecipeCardWidget extends StatelessWidget {
  final Recipe recipe;

  const RecipeCardWidget({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Image.network(
        recipe.largeImageURL,
        width: double.infinity,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}
