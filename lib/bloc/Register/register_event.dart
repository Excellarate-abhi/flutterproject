part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent extends Equatable {}

class SignupEvent extends RegisterEvent {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? mobileNo;
  String? isEnabled;

  SignupEvent(
      {this.firstName,
      this.lastName,
      this.email,
      this.mobileNo,
      this.password,
      this.isEnabled});

  @override
  List<Object?> get props =>
      [firstName, lastName, email, password, mobileNo, isEnabled];
}
