part of 'register_bloc.dart';

@immutable
abstract class RegisterState extends Equatable {}

class SignupInitial extends RegisterState {
  @override
  List<Object?> get props => [];
}

class SignupSuccessful extends RegisterState {
  @override
  List<Object?> get props => [];
}

class SignupLoading extends RegisterState {
  @override
  List<Object?> get props => [];
}

class SignupError extends RegisterState {
  String? msgError;
  SignupError(this.msgError);
  @override
  List<Object?> get props => [msgError];
}
