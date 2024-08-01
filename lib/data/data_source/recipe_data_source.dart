import '../dto/recipe_dto.dart';

abstract interface class RecipeDataSource {
  Future<List<RecipeResultDto>> getRecipes(String foodName);
}
