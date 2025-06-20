import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/presentation/authentication/Domain/Entity/failures.dart';
import 'package:movies/presentation/profile%20update/data/data_sources/remote/reset_password_remote_data_source.dart';
import 'package:movies/presentation/profile%20update/data/models/ResetPasswordDm.dart';
import 'package:movies/presentation/profile%20update/domain/entitys/ResetPasswordEntity.dart';
import 'package:movies/presentation/profile%20update/domain/repository/reset_password_repository.dart';
import 'package:movies/presentation/profile%20update/domain/repository/update_profile_repository.dart';

@Injectable(as: ResetPasswordRepository)
class ResetPasswordRepositoryImpl implements ResetPasswordRepository {
  final ResetPasswordRemoteDataSource resetPasswordRemoteDataSource;

  ResetPasswordRepositoryImpl({required this.resetPasswordRemoteDataSource});

  @override
  Future<Either<Failures, ResetPasswordEntity>> reset(
      {required String oldPassword, required String newPassword}) async {
    var either = await resetPasswordRemoteDataSource.reset(
        oldPassword: oldPassword, newPassword: newPassword);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
