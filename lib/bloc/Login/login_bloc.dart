import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutternewproject/repository/repo_login.dart';
import 'package:flutternewproject/widgets/validator.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<AuthEvent, LoginState> with validators{
  final AuthRepo _authRepo;
  LoginBloc(this._authRepo) : super(AuthLoading()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await _authRepo.login(event.email, event.password);
      if (result != "user not found") {
        emit(AuthSuccessful());
      }
      if (result == "user not found") {
        emit(AuthError("Missing password OR  user not found"));
      }
    });
  }
}
