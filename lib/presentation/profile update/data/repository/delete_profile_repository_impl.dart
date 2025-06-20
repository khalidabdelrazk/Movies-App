import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/presentation/authentication/Domain/Entity/failures.dart';
import 'package:movies/presentation/profile%20update/data/data_sources/remote/delete_profile_remote_data_source.dart';
import 'package:movies/presentation/profile%20update/domain/entitys/DeleteResponseEntity.dart';
import 'package:movies/presentation/profile%20update/domain/repository/delete_profile_repository.dart';

@Injectable(as: DeleteProfileRepository)
class DeleteProfileRepositoryImpl implements DeleteProfileRepository {
  final DeleteProfileRemoteDataSource deleteProfileRemoteDataSource;
  DeleteProfileRepositoryImpl({required this.deleteProfileRemoteDataSource});
  @override
  Future<Either<Failures, DeleteResponseEntity>> delete() {
    return deleteProfileRemoteDataSource.delete().then((value) {
      return value.fold(
        (error) => Left(error),
        (response) => Right(response),
      );
    });
  }
}



