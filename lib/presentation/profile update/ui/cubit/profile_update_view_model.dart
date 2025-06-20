import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/presentation/profile%20update/domain/use_cases/update_profile_use_case.dart';
import 'package:movies/presentation/profile%20update/ui/cubit/profile_update_states.dart';

@injectable
class UpdateProfilePageViewModel extends Cubit<UpdateProfileStates> {
  UpdateProfileUseCase updateProfileUseCase;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int? selectedAvatar;

  UpdateProfilePageViewModel({required this.updateProfileUseCase})
      : super(UpdateProfileInitialState());
  //todo: hold Data - handle Logic
  void updateData() async {
    emit(UpdateProfileLoadingState());
    final result = await updateProfileUseCase.invoke(
        avaterId: selectedAvatar ?? 1,
        name: nameController.text,
        phone: phoneController.text);

    result.fold(
        (error) => emit(UpdateProfileErrorState(failures: error)),
        (profileData) => emit(UpdateProfileSuccessState(
            updateProfileResponseEntity: profileData)));
  }
}
