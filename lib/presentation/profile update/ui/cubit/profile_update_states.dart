import 'package:movies/presentation/authentication/Domain/Entity/failures.dart';
import 'package:movies/presentation/profile%20update/domain/entitys/UpdateProfileResponseEnity.dart';

abstract class UpdateProfileStates {}

class UpdateProfileLoadingState extends UpdateProfileStates {}

class UpdateProfileInitialState extends UpdateProfileStates {}

class UpdateProfileErrorState extends UpdateProfileStates {
  Failures failures;
  UpdateProfileErrorState({required this.failures});
}

class UpdateProfileSuccessState extends UpdateProfileStates {
  UpdateProfileResponseEntity updateProfileResponseEntity;
  UpdateProfileSuccessState({required this.updateProfileResponseEntity});
}
