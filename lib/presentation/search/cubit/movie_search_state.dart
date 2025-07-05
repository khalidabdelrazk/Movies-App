part of 'movie_search_cubit.dart';

abstract class MovieSearchState {}

class MovieSearchInitial extends MovieSearchState {}

class MovieSearchLoading extends MovieSearchState {}

class MovieSearchSuccess extends MovieSearchState {
  final List<Movies> movies;
  MovieSearchSuccess(this.movies);
}

class MovieSearchError extends MovieSearchState {
  final String message;
  MovieSearchError(this.message);
}
