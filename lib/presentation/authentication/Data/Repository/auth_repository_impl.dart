import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/presentation/authentication/Domain/Entity/login_response_entity.dart';
import '../../Domain/Entity/failures.dart';
import '../../Domain/Entity/register_response_entity.dart';
import '../../Domain/Repository/auth_repository.dart';
import '../Data Sources/remote/auth_remote_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(
      String? name,
      String? email,
      String? password,
      String? rePassword,
      String? phone,
      int? avatarId) async {
    var either = await authRemoteDataSource.register(
      name,
      email,
      password,
      rePassword,
      phone,
      avatarId
    );

    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login(String? email, String? password) async {
    var either = await authRemoteDataSource.login(
        email,
        password,
    );

    return either.fold((error) => Left(error), (response) => Right(response));
  }


}
