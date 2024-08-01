import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required String largeImageURL,
    required String user,
    required String tags,
  }) = _Recipe;
  
  factory Recipe.fromJson(Map<String, Object?> json) => _$RecipeFromJson(json); 
}