import 'package:either_dart/either.dart';
import 'package:movies/presentation/authentication/Domain/Entity/failures.dart';
import 'package:movies/presentation/profile%20update/domain/entitys/DeleteResponseEntity.dart';

abstract class DeleteProfileRemoteDataSource {
  Future<Either<Failures, DeleteResponseEntity>> delete();
}
