import 'package:movies/core/model/movies_response.dart';


abstract class MoviesState {}


class MoviesLoading extends MoviesState {}

class MoviesSucess extends MoviesState {
  final List<Movies> movies;

  MoviesSucess(this.movies);
}

class MoviesError extends MoviesState {
  final String message;

  MoviesError(this.message);
}