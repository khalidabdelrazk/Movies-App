import 'package:either_dart/either.dart';
import '../Entity/failures.dart';
import '../Entity/register_response_entity.dart';

abstract class AuthRepository {
  Future<Either<Failures, RegisterResponseEntity>> register(
    String? name,
    String? email,
    String? password,
    String? rePassword,
    String? phone,
      int? avatarId
  );
}
