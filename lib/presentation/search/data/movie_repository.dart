import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../core/model/movies_response.dart';


class MovieRepository {
  Future<List<Movies>> searchMovies(String query) async {
    final url = Uri.parse('https://yts.mx/api/v2/list_movies.json?query_term=$query');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final moviesResponse = MoviesResponse.fromJson(jsonBody);
      return moviesResponse.data?.movies ?? [];
    } else {
      throw Exception('Failed to fetch movies');
    }
  }
}
