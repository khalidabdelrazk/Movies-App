import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:movies/presentation/profile/Domain/use_cases/profile_get_use_case.dart';
import 'package:movies/presentation/profile/Domain/use_cases/wishlist_use_case.dart';
import 'package:movies/presentation/profile/ui/cubit/profile_page_states.dart';

@injectable
class ProfilePageViewModel extends Cubit<ProfilePageStates> {
  ProfileGetUseCase profileGetUseCase;
  WishlistUseCase wishlistUseCase;

  ProfilePageViewModel({required this.profileGetUseCase,required this.wishlistUseCase})
      : super(ProfileInitialState());
  //todo: hold Data - handle Logic
  void getData() async {
    emit(ProfileLoadingState());
    final result = await profileGetUseCase.invoke();

    result.fold(
        (error) => emit(ProfileErrorState(failures: error)),
        (profileData) =>
            emit(ProfileSuccessState(getProfileResponseEntity: profileData)));
  }

  getWishList() async{
    emit(ProfileLoadingState());
    final result = await wishlistUseCase.invoke();

    result.fold(
            (error) => emit(WishlistErrorState(failures: error)),
            (response) =>
            emit(WishlistSuccessState(wishlistEntity: response)));
  }
}
