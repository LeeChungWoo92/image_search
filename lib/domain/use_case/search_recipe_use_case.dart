import 'package:image_search/core/result.dart';
import 'package:image_search/domain/model/recipe.dart';
import 'package:image_search/domain/repository/recipe_repository.dart';

class SearchRecipeUseCase {
  final RecipeRepository _recipeRepository;

  SearchRecipeUseCase(this._recipeRepository);

  Future<Result<List<Recipe>>> execute(String foodName) async {
    try {
      final data = await _recipeRepository.getRecipes(foodName);
      print('정보 usecase: $data');
      return Result.success(data);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
