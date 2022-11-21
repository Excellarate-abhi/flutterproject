import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutternewproject/bloc/Login/login_bloc.dart';
import 'package:flutternewproject/bloc/MyDay/myday_bloc.dart';
import 'package:flutternewproject/bloc/Register/register_bloc.dart';
import 'package:flutternewproject/repository/repo_login.dart';
import 'package:flutternewproject/repository/repo_myday.dart';
import 'package:flutternewproject/repository/repo_register.dart';
import 'package:flutternewproject/screen/login_screen.dart';
import 'package:flutternewproject/widgets/PreferenceUtils.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.init();
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
        BlocProvider(create: (context) => MyDayBloc(MyDayRepo())),
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

