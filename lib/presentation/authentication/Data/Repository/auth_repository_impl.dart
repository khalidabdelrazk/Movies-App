import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../Domain/Entity/failures.dart';
import '../../Domain/Entity/register_response_entity.dart';
import '../../Domain/Repository/auth_repository.dart';
import '../Data Sources/remote/auth_remote_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource registerRemoteDataSource;
  AuthRepositoryImpl({required this.registerRemoteDataSource});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(
      String? name,
      String? email,
      String? password,
      String? rePassword,
      String? phone,
      int? avatarId) async {
    var either = await registerRemoteDataSource.register(
      name,
      email,
      password,
      rePassword,
      phone,
      avatarId
    );

    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
