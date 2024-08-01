import 'package:get_it/get_it.dart';
import 'package:image_search/data/data_source/recipe_data_source.dart';
import 'package:image_search/data/data_source/recipe_data_source_impl.dart';
import 'package:image_search/data/repository/recipe_repository_impl.dart';
import 'package:image_search/domain/repository/recipe_repository.dart';
import 'package:image_search/domain/use_case/search_recipe_use_case.dart';
import 'package:image_search/presentation/search_recipe/search_recipe_list_view_model.dart';

final getIt = GetIt.instance;

void diSetUp() {
  //싱글턴
  getIt.registerSingleton<RecipeDataSource>(RecipeDataSourceImpl());
  getIt.registerSingleton<RecipeRepository>(RecipeRepositoryImpl(getIt()));
  getIt.registerSingleton(SearchRecipeUseCase(getIt()));

  //팩토리
  getIt.registerFactory<SearchRecipeListViewModel>(() => SearchRecipeListViewModel(getIt()));
}
