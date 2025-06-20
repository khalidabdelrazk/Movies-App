import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/api%20manager/api_endpoints.dart';
import 'package:movies/core/api%20manager/api_manager.dart';
import 'package:movies/core/utils/shared_pref_services.dart';
import 'package:movies/presentation/authentication/Domain/Entity/failures.dart';
import 'package:movies/presentation/profile%20update/data/data_sources/remote/reset_password_remote_data_source.dart';
import 'package:movies/presentation/profile%20update/data/data_sources/remote/update_profile_remote_data_source.dart';
import 'package:movies/presentation/profile%20update/data/models/ResetPasswordDm.dart';
import 'package:movies/presentation/profile%20update/data/models/UpdateResponseDm.dart';

@Injectable(as: ResetPasswordRemoteDataSource)
class ResetPasswordRemoteDataSourceImpl
    implements ResetPasswordRemoteDataSource {
  ApiManager apiManager;
  ResetPasswordRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, ResetPasswordDm>> reset(
      {required String oldPassword, required String newPassword}) async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();

    try {
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        final token = SharedPrefService.instance.getToken();

        if (token == null) {
          return Left(ServerError(errorMessage: "Token not found"));
        }

        final response = await apiManager.patchData(
          path: ApiEndpoints.resetPassword,
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token",
            },
            validateStatus: (status) => true,
          ),
          data: {
            "oldPassword": oldPassword,
            "newPassword": newPassword,
          },
        );

        print("RESPONSE Profile BODY: ${response.data}");
        print("STATUS Profile CODE: ${response.statusCode}");

        final ResetPasswordDm profileResponse =
            ResetPasswordDm.fromJson(response.data);

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
