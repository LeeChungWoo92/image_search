import 'package:image_search/data/data_source/recipe_data_source.dart';
import 'package:image_search/data/mapper/recipe_mapper.dart';
import 'package:image_search/domain/repository/recipe_repository.dart';

import '../../domain/model/recipe.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  RecipeRepositoryImpl(this._recipeDataSource);

  @override
  Future<List<Recipe>> getRecipes(String foodName) async {
    try {
      final recipeList = await _recipeDataSource.getRecipes(foodName);
      return recipeList.map((e) => e.toRecipe()).toList();
    } catch (e) {
      return throw Exception('');
    }
  }
}
