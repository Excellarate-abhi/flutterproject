import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutternewproject/model/planner.dart';
import 'package:flutternewproject/repository/repo_myday.dart';

part 'myday_event.dart';
part 'myday_state.dart';

class MyDayBloc extends Bloc<MyDayEvent, MyDayState> {
  final MyDayRepo _myDayRepo;
  MyDayBloc(this._myDayRepo) : super(MyDayLoading()) {
    on<mydayEvent>((event, emit) async {
      emit(MyDayLoading());
      final result = await _myDayRepo.planner(event.userId);
      if (result != "user not found") {
        emit(MyDaySuccessful(result));
      }
      if (result == "user not found") {
        emit(MyDayError("Missing password OR  user not found"));
      }
    });
  }

}
