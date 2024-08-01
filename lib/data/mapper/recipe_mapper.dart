import 'package:image_search/data/dto/recipe_dto.dart';
import 'package:image_search/domain/model/recipe.dart';

extension RecipeMapper on RecipeResultDto {
  Recipe toRecipe() {
    return Recipe(
      tags: tags ?? '',
      largeImageURL: largeImageURL ?? '',
      user: user ?? '',
    );
  }
}
