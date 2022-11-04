part of 'login_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {}


class LoginEvent extends AuthEvent{

  String? email ;
  String? password ;

  LoginEvent({this.email,this.password});

  @override
  List<Object?> get props => [email,password];

}