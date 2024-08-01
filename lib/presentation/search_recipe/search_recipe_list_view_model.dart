import 'package:flutter/material.dart';
import 'package:image_search/core/result.dart';
import 'package:image_search/domain/model/recipe.dart';
import 'package:image_search/domain/use_case/search_recipe_use_case.dart';
import 'package:image_search/presentation/search_recipe/search_recipe_list_ui_state.dart';

class SearchRecipeListViewModel with ChangeNotifier {
  final SearchRecipeUseCase _searchRecipeUseCase;

  SearchRecipeListViewModel(this._searchRecipeUseCase);

  SearchRecipeListUiState _state = const SearchRecipeListUiState();

  SearchRecipeListUiState get state => _state;

  void getSearchRecipes(String foodName) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();
    final result = await _searchRecipeUseCase.execute(foodName);
    switch (result) {
      case Success<List<Recipe>>():
        _state = state.copyWith(recipe: result.data, isLoading: false);
      case Error<List<Recipe>>():
        _state = state.copyWith(errorMessage: '에러발생', isLoading: false);
    }
    notifyListeners();
  }
}
