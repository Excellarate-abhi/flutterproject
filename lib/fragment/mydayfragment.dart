import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutternewproject/bloc/Planner/planner_bloc.dart';

import '../model/planner.dart';

class MyDay_Fragment extends StatefulWidget {
  const MyDay_Fragment({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyDay_FragmentState();
}

class _MyDay_FragmentState extends State<MyDay_Fragment> {
  PlannerBloc? _plannerBloc;
  @override
  void initState() {
    super.initState();
    _plannerBloc= BlocProvider.of<PlannerBloc>(context);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PlannerList>>(
      future: fetchPlannerData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PlannerList>? planner_data = snapshot.data;
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  fetchPlannerData() {
    _plannerBloc!.add(MyDayEvent(userId: "userID"));
  }
}
