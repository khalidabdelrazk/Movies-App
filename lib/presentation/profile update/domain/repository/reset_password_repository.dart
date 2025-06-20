import 'package:either_dart/either.dart';
import 'package:movies/presentation/authentication/Domain/Entity/failures.dart';
import 'package:movies/presentation/profile%20update/domain/entitys/ResetPasswordEntity.dart';

abstract class ResetPasswordRepository {
  Future<Either<Failures, ResetPasswordEntity>> reset(
      {required String oldPassword, required String newPassword});
}
