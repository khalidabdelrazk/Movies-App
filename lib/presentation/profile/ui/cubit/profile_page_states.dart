import 'package:movies/presentation/authentication/Domain/Entity/failures.dart';
import 'package:movies/presentation/profile/Domain/entitys/GetProfileResponseEntity.dart';
import 'package:movies/presentation/profile/Domain/entitys/wishlist_entity.dart';

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

// Wishlist States

class WishlistLoadingState extends ProfilePageStates {}

class WishlistInitialState extends ProfilePageStates {}

class WishlistErrorState extends ProfilePageStates {
  Failures failures;
  WishlistErrorState({required this.failures});
}

class WishlistSuccessState extends ProfilePageStates {
  WishlistEntity wishlistEntity;
  WishlistSuccessState({required this.wishlistEntity});
}
