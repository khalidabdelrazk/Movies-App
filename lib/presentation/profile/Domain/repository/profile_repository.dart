import 'package:either_dart/either.dart';
import 'package:movies/presentation/authentication/Domain/Entity/failures.dart';
import 'package:movies/presentation/authentication/Domain/Entity/register_response_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failures, RegisterResponseEntity>> getProfile(String? token);
}
