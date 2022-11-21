import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutternewproject/constants/constant.dart';
import 'package:flutternewproject/repository/repo_login.dart';
import 'package:flutternewproject/widgets/PreferenceUtils.dart';
import 'package:flutternewproject/widgets/validator.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<AuthEvent, LoginState> with validators{
  final AuthRepo _authRepo;
  LoginBloc(this._authRepo) : super(AuthLoading()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await _authRepo.loginrepo(event.email, event.password);
      if (result != "user not found") {
        emit(AuthSuccessful());
        await PreferenceUtils.setString(USERID, result.data?.id);
      }
      if (result == "user not found") {
        emit(AuthError("Missing password OR  user not found"));
      }
    });
  }
}
