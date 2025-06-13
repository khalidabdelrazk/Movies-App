import 'package:either_dart/either.dart';
import 'package:movies/presentation/authentication/Domain/Entity/failures.dart';
import 'package:movies/presentation/profile/Domain/entitys/GetProfileResponseEntity.dart';
import 'package:movies/presentation/profile/Domain/repository/profile_repository.dart';

class ProfileGetUseCase {
  ProfileRepository profileRepository;
  ProfileGetUseCase({required this.profileRepository});

  Future<Either<Failures, GetProfileResponseEntity>> invoke() {
    return profileRepository.getProfile();
  }
}
