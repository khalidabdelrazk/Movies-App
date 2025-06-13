import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/presentation/authentication/Domain/Entity/failures.dart';
import 'package:movies/presentation/profile/Data/Data%20Sources/remote/get_profile_remote_data_source.dart';
import 'package:movies/presentation/profile/Domain/Repository/profile_repository.dart';
import 'package:movies/presentation/profile/Domain/entitys/GetProfileResponseEntity.dart';

@Injectable(as: ProfileRepository) 
class ProfileRepositoryImpl implements ProfileRepository {
  GetProfileRemoteDataSource getProfileRemoteDataSource;

  ProfileRepositoryImpl({required this.getProfileRemoteDataSource});
  @override
  Future<Either<Failures, GetProfileResponseEntity>> getProfile() async {
    var either = await getProfileRemoteDataSource.getProfile();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
