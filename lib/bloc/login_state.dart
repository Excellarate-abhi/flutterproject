part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {}

class AuthInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

class AuthSuccessful extends LoginState {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

class AuthError extends LoginState {
  String? msgError;
  AuthError(this.msgError);
  @override
  List<Object?> get props => [msgError];
}
