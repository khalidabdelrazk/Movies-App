import 'package:injectable/injectable.dart';
import 'package:movies/presentation/profile/Domain/repository/profile_repository.dart';
import 'package:movies/presentation/profile/Domain/entitys/GetProfileResponseEntity.dart';
import 'package:movies/presentation/profile/Data/Data Sources/remote/get_profile_remote_data_source.dart';
import 'package:either_dart/either.dart';
import 'package:movies/presentation/authentication/Domain/Entity/failures.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  final GetProfileRemoteDataSource getProfileRemoteDataSource;

  ProfileRepositoryImpl({required this.getProfileRemoteDataSource});

  @override
  Future<Either<Failures, GetProfileResponseEntity>> getProfile() async {
    var either = await getProfileRemoteDataSource.getProfile();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
