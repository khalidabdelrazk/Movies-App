import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/api%20manager/api_endpoints.dart';
import 'package:movies/core/api%20manager/api_manager.dart';
import 'package:movies/core/utils/shared_pref_services.dart';
import 'package:movies/presentation/authentication/Domain/Entity/failures.dart';
import 'package:movies/presentation/profile/Data/Data%20Sources/remote/get_profile_remote_data_source.dart';
import 'package:movies/presentation/profile/Data/Models/GetProfileResponseDm.dart';

@Injectable(as: GetProfileRemoteDataSource)
class GetProfileRemoteDataSourceImpl implements GetProfileRemoteDataSource {
  ApiManager apiManager;
  GetProfileRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, GetProfileResponseDm>> getProfile() async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();

    try {
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        final token = SharedPrefService.instance.getToken();

        if (token == null) {
          return Left(ServerError(errorMessage: "Token not found"));
        }

        final response = await apiManager.getData(
          path: ApiEndpoints.getProfile,
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token",
            },
            validateStatus: (status) => true,
          ),
        );

        print("RESPONSE Profile BODY: ${response.data}");
        print("STATUS Profile CODE: ${response.statusCode}");

        final GetProfileResponseDm profileResponse =
            GetProfileResponseDm.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(profileResponse);
        } else {
          return Left(ServerError(
              errorMessage: profileResponse.message ?? "Unknown error"));
        }
      } else {
        return Left(NetworkError(errorMessage: "No Internet Connection"));
      }
    } catch (e) {
      print("ERROR: $e");
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
