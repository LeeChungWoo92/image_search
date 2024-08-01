import 'dart:convert';

import 'package:image_search/data/data_source/recipe_data_source.dart';
import 'package:image_search/data/dto/recipe_dto.dart';
import 'package:http/http.dart' as http;

class RecipeDataSourceImpl implements RecipeDataSource {
  static const String _pixabayApiKey = '11245670-ca96b1d5b68fd166182c5d00a';
  static const String _pixapayUrl = 'https://pixabay.com/api/?key=$_pixabayApiKey';

  @override
  Future<List<RecipeResultDto>> getRecipes(String foodName) async {
    final String url = '$_pixapayUrl&q=$foodName&image_type=photo';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return List.unmodifiable([RecipeResultDto.fromJson(jsonResponse)]);
    } else {
      throw Exception('');
    }
  }
}
