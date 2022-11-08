import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutternewproject/bloc/Login/login_bloc.dart';
import 'package:flutternewproject/bloc/Planner/planner_bloc.dart';
import 'package:flutternewproject/bloc/Register/register_bloc.dart';
import 'package:flutternewproject/repository/repo_login.dart';
import 'package:flutternewproject/repository/repo_planner.dart';
import 'package:flutternewproject/repository/repo_register.dart';
import 'package:flutternewproject/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc(AuthRepo())),
        BlocProvider(create: (context) => RegisterBloc(RegisterRepo())),
        BlocProvider(create: (context) => PlannerBloc(PlannerRepo())),
      ],
      child: MaterialApp(
        title: 'Wisetail',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

