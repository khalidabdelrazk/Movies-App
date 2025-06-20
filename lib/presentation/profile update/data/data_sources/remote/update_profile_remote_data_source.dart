import 'package:either_dart/either.dart';
import 'package:movies/presentation/authentication/Domain/Entity/failures.dart';
import 'package:movies/presentation/profile%20update/domain/entitys/UpdateProfileResponseEnity.dart';
import 'package:movies/presentation/profile/Domain/entitys/GetProfileResponseEntity.dart';

//todo:interface
abstract class UpdateProfileRemoteDataSource {
  Future<Either<Failures, UpdateProfileResponseEntity>> update(
      {required String name, required String email, required int avaterId});
}
