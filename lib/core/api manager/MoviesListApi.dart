import 'package:movies/core/api%20manager/api_endpoints.dart';
import 'package:movies/core/api%20manager/api_manager.dart';
import 'package:movies/core/model/movies_response.dart';

final apiManager = ApiManager();

class MoviesListApi {
  static Future<MoviesResponse?> fetchUserData() async {
    try {
      final response = await apiManager.getData(
        path: ApiEndpoints.listMovies,
        queryParameters: {
          "limit": 50
        }
      );
    
      return MoviesResponse.fromJson(response.data);
    } catch (e) {
      print(e.toString());
    }
  }
  
}














// class MoviesListApi{
//     static Dio dio = Dio() ;
//     static Future<void> getData()async{
//         var response =await dio.get(ApiEndpoints.listMovies);
//         print(response.data) ;
//       }
// }