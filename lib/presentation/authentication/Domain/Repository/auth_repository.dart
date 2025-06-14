import 'package:either_dart/either.dart';
import 'package:movies/presentation/authentication/Domain/Entity/login_response_entity.dart';
import '../Entity/failures.dart';
import '../Entity/register_response_entity.dart';

abstract class AuthRepository {
  Future<Either<Failures, RegisterResponseEntity>> register(
      String? name,
      String? email,
      String? password,
      String? rePassword,
      String? phone,
      int? avatarId);

  Future<Either<Failures, LoginResponseEntity>> login(
    String? email,
    String? password,
  );
}
