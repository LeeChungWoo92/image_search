import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_search/presentation/component/recipe_card_widget.dart';
import 'package:image_search/presentation/search_recipe/search_recipe_list_view_model.dart';
import 'package:provider/provider.dart';

class SearchRecipeListScreen extends StatefulWidget {
  const SearchRecipeListScreen({super.key});

  @override
  State<SearchRecipeListScreen> createState() => _SearchRecipeListScreenState();
}

class _SearchRecipeListScreenState extends State<SearchRecipeListScreen> {
  final _searchController = TextEditingController();
  Timer? _debounce;
  String _foodName = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  _onSearchChanged() {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    _debounce = Timer(const Duration(seconds: 1), () {
      setState(() {
        _foodName = _searchController.text;
        if (_foodName.isEmpty) return;
        context.read<SearchRecipeListViewModel>().getSearchRecipes(_foodName);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.grey),
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.green,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 2, color: Colors.green)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 2, color: Colors.green)),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: recipeList(context, _foodName),
            ),
          ],
        ),
      ),
    );
  }

  Widget recipeList(BuildContext context, String foodName) {
    final viewModel = context.watch<SearchRecipeListViewModel>();
    final recipes = viewModel.state.recipe;

    if (recipes.isEmpty) {
      return const Center(
        child: Text(
          '검색 결과가 없습니다.',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      );
    }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15.0,
      ),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        if (viewModel.state.isLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Hero(
          tag: recipe.largeImageURL,
          child: GestureDetector(
            onTap: () {
              context.push('/search_recipe_detail',extra: recipe);
            },
            child: RecipeCardWidget(
              recipe: recipe,
            ),
          ),
        );
      },
    );
  }
}
