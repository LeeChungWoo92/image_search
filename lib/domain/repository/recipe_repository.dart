import '../model/recipe.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> getRecipes(String foodName);
}
