import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/api%20manager/MoviesListApi.dart';
import 'package:movies/core/api%20manager/api_endpoints.dart';
import 'package:movies/core/model/movies_response.dart';

import 'package:movies/presentation/home/MovieStates/states.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesLoading());

  Future<void> fetchMovies() async {
    emit(MoviesLoading());

    try {
      
      emit(MoviesLoading());
        var response = await apiManager.getData(path: ApiEndpoints.listMovies) ;

        if (response.statusCode! <200||response.statusCode!>=300){
          emit(MoviesError( response.statusMessage!));
          return ;
        }

        if (response.statusCode! >=200&&response.statusCode!<300){
          final moviesResponse = MoviesResponse.fromJson(response.data);

            emit(MoviesSucess(moviesResponse.data!.movies??[]));
          return ;
        }
    } catch (e) {
      emit(MoviesError('Connection error: ${e.toString()}'));
    }
  }
}


 //final response = await http.get(Uri.parse(ApiEndpoints.listMovies));