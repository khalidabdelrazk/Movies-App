import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../Entity/failures.dart';
import '../Entity/register_response_entity.dart';
import '../Repository/auth_repository.dart';

@Injectable()
class RegisterUseCase {
  final AuthRepository registerRepository;
  RegisterUseCase({required this.registerRepository});
  Future<Either<Failures, RegisterResponseEntity>> invoke(
      String? name,
      String? email,
      String? password,
      String? rePassword,
      String? phone,
      int? avatarId) {
    return registerRepository.register(
        name, email, password, rePassword, phone, avatarId);
  }
}
