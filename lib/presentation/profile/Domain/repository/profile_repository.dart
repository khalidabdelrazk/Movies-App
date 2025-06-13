import 'package:either_dart/either.dart';
import 'package:movies/presentation/authentication/Domain/Entity/failures.dart';
import 'package:movies/presentation/profile/Domain/entitys/GetProfileResponseEntity.dart';

abstract class ProfileRepository {
  Future<Either<Failures, GetProfileResponseEntity>> getProfile();
}
