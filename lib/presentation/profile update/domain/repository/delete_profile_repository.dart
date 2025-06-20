import 'package:either_dart/either.dart';
import 'package:movies/presentation/authentication/Domain/Entity/failures.dart';
import 'package:movies/presentation/profile%20update/data/models/DeleteResponseDm.dart';
import 'package:movies/presentation/profile%20update/domain/entitys/DeleteResponseEntity.dart';

abstract class DeleteProfileRepository {
  Future<Either<Failures, DeleteResponseEntity>> delete();
}
