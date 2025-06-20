import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/presentation/profile%20update/domain/use_cases/delete_profile_use_case.dart';
import 'package:movies/presentation/profile%20update/domain/use_cases/reset_password_use_case.dart';
import 'package:movies/presentation/profile%20update/domain/use_cases/update_profile_use_case.dart';
import 'package:movies/presentation/profile%20update/ui/cubit/profile_update_states.dart';

@injectable
class UpdateProfilePageViewModel extends Cubit<UpdateProfileStates> {
  UpdateProfileUseCase updateProfileUseCase;
  DeleteProfileUseCase deleteProfileUseCase;
  ResetPasswordUseCase resetPasswordUseCase;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int? selectedAvatar;

  UpdateProfilePageViewModel(
      {required this.updateProfileUseCase,
      required this.deleteProfileUseCase,
      required this.resetPasswordUseCase})
      : super(UpdateProfileInitialState());
  //todo: hold Data - handle Logic
  //todo: update Data
  void updateData() async {
    emit(UpdateProfileLoadingState());
    final result = await updateProfileUseCase.invoke(
        avaterId: selectedAvatar ?? 1,
        name: nameController.text,
        email: emailController.text);

    result.fold(
        (error) => emit(UpdateProfileErrorState(failures: error)),
        (profileData) => emit(UpdateProfileSuccessState(
            updateProfileResponseEntity: profileData)));
  }

//todo: delete Profile
  void deleteProfile() async {
    emit(DeleteProfileLoadingState());
    final result = await deleteProfileUseCase.invoke();

    result.fold(
        (error) => emit(DeleteProfileErrorState(failures: error)),
        (deleteResponse) => emit(DeleteProfileSuccessState(
            deleteProfileResponseEntity: deleteResponse)));
  }

  //todo: reset Password

  void resetPassword() async {
    emit(ResetPasswordLoadingState());
    final result = await resetPasswordUseCase.invoke(
        newPassword: newPasswordController.text,
        oldPassword: oldPasswordController.text);

    result.fold(
        (error) => emit(ResetPasswordErrorState(failures: error)),
        (response) =>
            emit(ResetPasswordSuccessState(resetPasswordEntity: response)));
  }
}
