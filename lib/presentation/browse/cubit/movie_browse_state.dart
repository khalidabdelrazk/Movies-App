import '../../../../core/model/movies_response.dart';

abstract class MovieBrowseState {}

class MovieBrowseInitial extends MovieBrowseState {}

class MovieBrowseLoading extends MovieBrowseState {}

class MovieBrowseSuccess extends MovieBrowseState {
  final List<Movies> movies;
  final List<String> genres;
  final String? selectedGenre;

  MovieBrowseSuccess(this.movies, this.genres, this.selectedGenre);
}

class MovieBrowseError extends MovieBrowseState {
  final String message;
  MovieBrowseError(this.message);
}
