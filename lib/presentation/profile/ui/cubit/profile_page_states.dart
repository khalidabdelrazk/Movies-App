import 'package:movies/presentation/authentication/Domain/Entity/failures.dart';
import 'package:movies/presentation/profile/Domain/entitys/GetProfileResponseEntity.dart';

abstract class ProfilePageStates {}

class ProfileLoadingState extends ProfilePageStates {}

class ProfileInitialState extends ProfilePageStates {}

class ProfileErrorState extends ProfilePageStates {
  Failures failures;
  ProfileErrorState({required this.failures});
}

class ProfileSuccessState extends ProfilePageStates {
  GetProfileResponseEntity getProfileResponseEntity;
  ProfileSuccessState({required this.getProfileResponseEntity});
}
