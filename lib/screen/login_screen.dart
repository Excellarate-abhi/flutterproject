import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutternewproject/bloc/Login/login_bloc.dart';
import 'package:flutternewproject/screen/home.dart';
import 'package:flutternewproject/screen/register_screen.dart';
import '../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc? _loginBloc;
  final TextEditingController email = TextEditingController(text: "");
  final TextEditingController password = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/login.png'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 30, top: 170),
              child: Text(
                'Welcome\nBack',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.5,
                      right: 30,
                      left: 30),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: email,
                        hint: "Enter Email",
                        label: "Email",
                        inputType: TextInputType.emailAddress,
                        obscure: false,
                      ),
                      const SizedBox(height: 20.4),
                      CustomTextField(
                        controller: password,
                        hint: "Enter Password",
                        label: "Password",
                        inputType: TextInputType.emailAddress,
                        obscure: true,
                      ),
                      const SizedBox(height: 40),
                      BlocListener<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state is AuthLoading) {
                            const Center(
                                child: CircularProgressIndicator(
                              color: Colors.blue,
                            ));
                          } else if (state is AuthSuccessful) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return  HomePage();
                            }));
                          } else if (state is AuthError) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    content: Text(
                              'Error',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 30),
                            )));
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Color(0xff4c505b),
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700),
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Color(0xff4c505b),
                              child: IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  _loginBloc!.add(LoginEvent(
                                      email: email.text,
                                      password: password.text));
                                },
                                icon: Icon(Icons.arrow_forward),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Colors.red.shade800, fontSize: 20),
                                  children: [
                                    TextSpan(text: "Need an Account?"),
                                    WidgetSpan(child: SizedBox(width: 3.5)),
                                    TextSpan(
                                        text: "Register here",
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            RegisterScreen()));
                                          })
                                  ]),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

