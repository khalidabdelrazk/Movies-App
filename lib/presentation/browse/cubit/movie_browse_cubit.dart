import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/model/movies_response.dart';
import '../../search/data/movie_repository.dart';
import 'movie_browse_state.dart';

class MovieBrowseCubit extends Cubit<MovieBrowseState> {
  final MovieRepository repository;

  MovieBrowseCubit(this.repository) : super(MovieBrowseInitial());

  List<Movies> allMovies = [];

  Future<void> loadMovies() async {
    emit(MovieBrowseLoading());
    try {
      allMovies = await repository.searchMovies("");
      emit(MovieBrowseSuccess(allMovies, extractGenres(allMovies), null));
    } catch (e) {
      emit(MovieBrowseError("Failed to load movies: $e"));
    }
  }

  void filterByGenre(String genre) {
    final filtered = allMovies
        .where((movie) => movie.genres?.contains(genre) ?? false)
        .toList();
    emit(MovieBrowseSuccess(filtered, extractGenres(allMovies), genre));
  }

  List<String> extractGenres(List<Movies> movies) {
    return movies
        .expand((movie) => movie.genres ?? <String>[])
        .toSet()
        .toList();
  }
}
