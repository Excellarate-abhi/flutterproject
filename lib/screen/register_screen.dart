import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutternewproject/bloc/register_bloc.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RegisterBloc>(context, listen: false);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          alignment: Alignment.center,
          color: Colors.black12,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Register",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                StreamBuilder<Object>(
                    stream: bloc.name,
                    builder: (context, snapshot) {
                      return TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "Enter User Name",
                            labelText: "User Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onChanged: bloc.changeName,
                      );
                    }),
                const SizedBox(height: 30),
                StreamBuilder<Object>(
                    stream: bloc.email,
                    builder: (context, snapshot) {
                      return TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Enter Email ID",
                            labelText: "EmailId",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onChanged: bloc.changeEmail,
                      );
                    }),
                const SizedBox(height: 30),
                StreamBuilder<Object>(
                    stream: bloc.phoneNumber,
                    builder: (context, snapshot) {
                      return TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Enter Mobile Number",
                            labelText: "Mobile",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onChanged: bloc.changePhoneNumber,
                      );
                    }),
                const SizedBox(height: 30),
                StreamBuilder<Object>(
                    stream: bloc.password,
                    builder: (context, snapshot) {
                      return TextField(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: isVisible,
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            labelText: "Password",
                            suffixIcon: IconButton(
                              icon: isVisible
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onPressed: () {
                                setState((){
                                  isVisible = !isVisible;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onChanged: bloc.changePassword,
                      );
                    }),
                const SizedBox(height: 30),
                StreamBuilder<Object>(
                    stream: bloc.confirmPassword,
                    builder: (context, snapshot) {
                      return TextField(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: isVisible,
                        decoration: InputDecoration(
                            hintText: "Enter Confirm Password",
                            labelText: "Confirm Password",
                            suffixIcon: IconButton(
                              icon: isVisible
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });

                              },
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onChanged: bloc.changeConfirmPassword,
                      );
                    }),
                const SizedBox(height: 30),
                loginButton(),
                const SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.red.shade800),
                      children: [
                        TextSpan(text: "Already have an account?"),
                        WidgetSpan(child: SizedBox(width: 3.5)),
                        TextSpan(
                            text: "Login here",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              })
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton() {
    return GestureDetector(
      onTap: () {
        //TODO : REGISTER HERE
      },
      child: Container(
        height: 45,
        width: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.purpleAccent.shade100),
        child: Text(
          "Register",
          style: TextStyle(fontSize: 20, color: Colors.white70),
        ),
      ),
    );
  }
}
