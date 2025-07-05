import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/model/movies_response.dart';
import '../data/movie_repository.dart';
part 'movie_search_state.dart';

class MovieSearchCubit extends Cubit<MovieSearchState> {
  final MovieRepository repository;

  MovieSearchCubit(this.repository) : super(MovieSearchInitial());

  void search(String query) async {
    if (query.isEmpty) return;
    emit(MovieSearchLoading());
    try {
      final movies = await repository.searchMovies(query);
      emit(MovieSearchSuccess(movies));
    } catch (e) {
      emit(MovieSearchError("Something went wrong: $e"));
    }
  }

  void reset() {
    emit(MovieSearchInitial());
  }
}
