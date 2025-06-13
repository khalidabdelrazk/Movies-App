import 'package:either_dart/src/either.dart';
import 'package:movies/presentation/authentication/Domain/Entity/failures.dart';
import 'package:movies/presentation/profile/Domain/Repository/profile_repository.dart';
import 'package:movies/presentation/profile/Domain/entitys/GetProfileResponseEntity.dart';

class ProfileRepositoryImpl implements ProfileRepository 
{
  @override
  Future<Either<Failures, GetProfileResponseEntity>> getProfile() {
    // TODO: implement getProfile
    throw UnimplementedError();
  }
  
}
