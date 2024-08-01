import 'package:go_router/go_router.dart';
import 'package:image_search/presentation/search_recipe/search_recipe_list_screen.dart';
import 'package:image_search/presentation/search_recipe/search_recipe_list_view_model.dart';
import 'package:provider/provider.dart';

import '../di/di_setup.dart';
import '../domain/model/recipe.dart';
import '../presentation/search_recipe/search_recipe_detail_screen.dart';

final router = GoRouter(
  initialLocation: '/search_recipe_list',
  routes: [
    GoRoute(
      path: '/search_recipe_list',
      builder: (context, state) {
        return ChangeNotifierProvider<SearchRecipeListViewModel>(
          create: (_) => getIt<SearchRecipeListViewModel>(),
          child: const SearchRecipeListScreen(),
        );
      },
    ),
    GoRoute(
      path: '/search_recipe_detail',
      builder: (context, state) {
        final recipe = state.extra as Recipe;
        return ChangeNotifierProvider<SearchRecipeListViewModel>(
          create: (_) => getIt<SearchRecipeListViewModel>(),
          child: SearchRecipeDetailScreen(recipe: recipe),
        );
      },
    ),
  ],
);
