import 'package:rxdart/subjects.dart';

class LoginBloc {
  final _loginEmail  = BehaviorSubject<String>();
  final _loginPassword  = BehaviorSubject<String>();

  //getters
  Stream<String> get loginEmail => _loginEmail.stream;
  Stream<String> get loginPassword => _loginPassword.stream;


  //setters
  Function(String) get changeLoginEmail => _loginEmail.sink.add;
  Function(String) get changeLoginPassword => _loginPassword.sink.add;


  void dispose(){
    _loginEmail.close();
    _loginPassword.close();
  }

}