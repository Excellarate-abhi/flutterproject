import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutternewproject/constants/constant.dart';
import 'package:flutternewproject/repository/repo_myday.dart';
import 'package:flutternewproject/widgets/PreferenceUtils.dart';

import '../bloc/MyDay/myday_bloc.dart';
import '../model/planner.dart';
import '../widgets/wisetailcard.dart';

class MyDay_Fragment extends StatefulWidget {
  const MyDay_Fragment({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyDay_FragmentState();
}

class _MyDay_FragmentState extends State<MyDay_Fragment> {
  MyDayBloc? _myDayBloc;

  @override
  void initState() {
    super.initState();
    _myDayBloc = BlocProvider.of<MyDayBloc>(context);
    _myDayBloc!.add(mydayEvent(userId: PreferenceUtils.getString(USERID)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MyDayBloc, MyDayState>(
        builder: (context, state) {
          if (state is MyDayLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.blue,
            ));
          } else if (state is MyDaySuccessful) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: state.planner_model.data?.plannerList?.length,
                itemBuilder: (context, index) {
                  return WiseTailCard(state.planner_model.data?.plannerList![index] as PlannerList);
                });
          } else if (state is MyDayError) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
              'Error',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 30),
            )));
          }
          return Container();
        },
      ),
    );
  }

  fetchPlannerData() {
    _myDayBloc!.add(mydayEvent(userId: PreferenceUtils.getString(USERID)));
  }
}
