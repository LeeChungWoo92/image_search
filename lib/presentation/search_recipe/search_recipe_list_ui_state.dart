import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_search/domain/model/recipe.dart';

part 'search_recipe_list_ui_state.freezed.dart';

part 'search_recipe_list_ui_state.g.dart';

@freezed
class SearchRecipeListUiState with _$SearchRecipeListUiState {
  const factory SearchRecipeListUiState({
    @Default([]) List<Recipe> recipe,
    @Default(false) bool isLoading,
    @Default('에러발생') String errorMessage,

  }) = _SearchRecipeListUiState;

  factory SearchRecipeListUiState.fromJson(Map<String, Object?> json) => _$SearchRecipeListUiStateFromJson(json);
}