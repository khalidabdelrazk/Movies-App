import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/presentation/authentication/Domain/Entity/failures.dart';
import 'package:movies/presentation/profile%20update/domain/entitys/DeleteResponseEntity.dart';
import 'package:movies/presentation/profile%20update/domain/repository/delete_profile_repository.dart';

@injectable
class DeleteProfileUseCase {
  DeleteProfileRepository deleteProfileRepository;

  DeleteProfileUseCase({required this.deleteProfileRepository});

  Future<Either<Failures, DeleteResponseEntity>> invoke() {
    return deleteProfileRepository.delete();
  }
}



