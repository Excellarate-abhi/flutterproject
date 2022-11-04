import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutternewproject/bloc/Register/register_bloc.dart';
import 'package:flutternewproject/screen/login_screen.dart';

import '../widgets/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterBloc? _registerBloc;
  final TextEditingController fUserName = TextEditingController(text: "");
  final TextEditingController lUserName = TextEditingController(text: "");
  final TextEditingController password = TextEditingController(text: "");
  final TextEditingController confirmPassword = TextEditingController(text: "");
  final TextEditingController emailId = TextEditingController(text: "");
  final TextEditingController mobileNumber = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/register.png'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 30, top: 70),
              child: Text(
                'Create\nAccount',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.25,
                      right: 30,
                      left: 30),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: fUserName,
                        hint: "Enter First Name",
                        label: "First Name",
                        inputType: TextInputType.text,
                        obscure: false,
                      ),
                      const SizedBox(height: 20.4),
                      CustomTextField(
                        controller: lUserName,
                        hint: "Enter Last Name",
                        label: "Last Name",
                        inputType: TextInputType.text,
                        obscure: false,
                      ),
                      const SizedBox(height: 20.4),
                      CustomTextField(
                        controller: emailId,
                        hint: "Enter Email Id",
                        label: "Email",
                        inputType: TextInputType.text,
                        obscure: false,
                      ),
                      const SizedBox(height: 20.4),
                      CustomTextField(
                        controller: mobileNumber,
                        hint: "Enter Mobile Number",
                        label: "Mobile",
                        inputType: TextInputType.number,
                        obscure: false,
                      ),
                      const SizedBox(height: 20.4),
                      CustomTextField(
                        controller: password,
                        hint: "Enter Password",
                        label: "Password",
                        inputType: TextInputType.text,
                        obscure: true,
                      ),
                      const SizedBox(height: 20.4),
                      CustomTextField(
                        controller: confirmPassword,
                        hint: "Enter Confirm Password",
                        label: "Confirm Password",
                        inputType: TextInputType.text,
                        obscure: true,
                      ),
                      const SizedBox(height: 40),
                      BlocListener<RegisterBloc, RegisterState>(
                        listener: (context, state) {
                          if (state is SignupLoading) {
                            const Center(
                                child: CircularProgressIndicator(
                              color: Colors.blue,
                            ));
                          } else if (state is SignupSuccessful) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const LoginScreen();
                            }));
                          } else if (state is SignupError) {
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
                              'Sign Up',
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
                                  _registerBloc!.add(SignupEvent(
                                    firstName: fUserName.text,
                                    lastName: lUserName.text,
                                    email: emailId.text,
                                    mobileNo: mobileNumber.text,
                                    password: password.text,
                                    isEnabled: "true"
                                  ));
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
                                    TextSpan(text: "Already have an account?"),
                                    WidgetSpan(child: SizedBox(width: 3.5)),
                                    TextSpan(
                                        text: "Login here",
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoginScreen()));
                                          }),
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
