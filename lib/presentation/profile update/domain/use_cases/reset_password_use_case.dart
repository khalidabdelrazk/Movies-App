import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/presentation/authentication/Domain/Entity/failures.dart';
import 'package:movies/presentation/authentication/ui/screens/reset_password.dart';
import 'package:movies/presentation/profile%20update/domain/entitys/ResetPasswordEntity.dart';
import 'package:movies/presentation/profile%20update/domain/repository/reset_password_repository.dart';

@injectable
class ResetPasswordUseCase {
  ResetPasswordRepository resetPasswordRepository;

  ResetPasswordUseCase({required this.resetPasswordRepository});

  Future<Either<Failures, ResetPasswordEntity>> invoke(
      {required String oldPassword, required String newPassword}) {
    return resetPasswordRepository.reset(
        newPassword: newPassword, oldPassword: oldPassword);
  }
}
