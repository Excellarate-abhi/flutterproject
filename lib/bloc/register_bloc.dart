import 'package:rxdart/subjects.dart';

class RegisterBloc{

  final _name = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _phoneNumber = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _confirmPassword = BehaviorSubject<String>();

  //getters
  Stream<String> get name => _name.stream;
  Stream<String> get email => _email.stream;
  Stream<String> get phoneNumber => _phoneNumber.stream;
  Stream<String> get password => _password.stream;
  Stream<String> get confirmPassword => _confirmPassword.stream;


  //setters
  Function(String) get changeName => _name.sink.add;
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePhoneNumber => _phoneNumber.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeConfirmPassword => _confirmPassword.sink.add;


  void dispose(){
    _name.close();
    _email.close();
    _phoneNumber.close();
    _password.close();
    _confirmPassword.close();

  }

}