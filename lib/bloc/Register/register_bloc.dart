import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutternewproject/repository/repo_register.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepo _registerRepo;

  RegisterBloc(this._registerRepo) : super(SignupLoading()) {
    on<SignupEvent>((event, emit) async {
      emit(SignupLoading());
      final result = await _registerRepo.register(
          event.firstName,
          event.lastName,
          event.email,
          event.password,
          event.mobileNo,
          event.isEnabled);
      if (result != "user not found") {
        emit(SignupSuccessful());
      }
      if (result == "user not found") {
        emit(SignupError("Missing password OR  user not found"));
      }
    });
  }
}
