import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutternewproject/bloc/login_bloc.dart';
import 'package:flutternewproject/screen/register_screen.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc? _loginBloc;
  final TextEditingController email =
  TextEditingController(text: "");
  final TextEditingController password =
  TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 170, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Center(
                child: Text(
                  "Login Screen",
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 40.4),
            CustomTextField(
              controller: email,
              obscure: false,
            ),
            const SizedBox(height: 20.4),
            CustomTextField(
              controller: email,
              obscure: true,
            ),
            const SizedBox(height: 20.4),
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is AuthLoading) {
                  const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ));
                } else if (state is AuthSuccessful) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const RegisterScreen();
                  }));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        'Welcome',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 30),
                      )));
                } else if (state is AuthError) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        'Error',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 30),
                      )));
                }
              },
              child: CustomButton(
                onPressed: () {
                  _loginBloc!.add(
                      LoginEvent(email: email.text, password: password.text));
                },
                text: "Login",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LoginBloc>(context, listen: false);
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
                  "Login",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                StreamBuilder<Object>(
                    stream: bloc.loginEmail,
                    builder: (context, snapshot) {
                      return TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Enter Email",
                            labelText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onChanged: (value) => bloc.changeLoginEmail,
                      );
                    }),
                const SizedBox(height: 30),
                StreamBuilder<Object>(
                    stream: bloc.loginPassword,
                    builder: (context, snapshot) {
                      return TextField(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            labelText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onChanged: (value) => bloc.changeLoginPassword,
                      );
                    }),
                const SizedBox(height: 30),
                loginButton(),
                const SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.red.shade800),
                      children: [
                        TextSpan(text: "Need an Account?"),
                        WidgetSpan(child: SizedBox(width: 3.5)),
                        TextSpan(
                            text: "Register here",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterScreen()));
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
        //TODO : LOGIN HERE
      },
      child: Container(
        height: 45,
        width: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.purpleAccent.shade100),
        child: Text(
          "Login",
          style: TextStyle(fontSize: 20, color: Colors.white70),
        ),
      ),
    );
  }*/



