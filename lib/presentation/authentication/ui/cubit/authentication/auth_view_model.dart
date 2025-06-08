import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/presentation/authentication/ui/cubit/authentication/auth_states.dart';
import '../../../Domain/Use Case/auth_use_case.dart';

@injectable
class AuthViewModel extends Cubit<AuthStates> {
  AuthUseCase registerUseCase;
  AuthViewModel({required this.registerUseCase}) : super(InitState());
  //
  final emailController = TextEditingController(
    text: 'amr212432@gmail.com',
  );
  final nameController = TextEditingController(text: 'khalidMohammed');
  final phoneController = TextEditingController(text: '+201141209334');
  final passwordController = TextEditingController(text: 'Amr2510@');
  final rePasswordController = TextEditingController(text: 'Amr2510@');
  final formKey = GlobalKey<FormState>();

  final loginPasswordController = TextEditingController();


  register(int? selectedAvatar) async {
    if (formKey.currentState?.validate() == true) {
      emit(ShowLoading());
      var either = await registerUseCase.registerInvoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        rePasswordController.text,
        phoneController.text,
        selectedAvatar,
      );
      either.fold(
        (left) => emit(ErrorState(errorMessage: left.errorMessage)),
        (right) => emit(SuccessState(response: right)),
      );
    }
  }
}
