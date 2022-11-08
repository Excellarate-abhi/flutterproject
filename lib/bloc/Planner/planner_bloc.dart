import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutternewproject/repository/repo_planner.dart';

part 'planner_event.dart';
part 'planner_state.dart';

class PlannerBloc extends Bloc<PlannerEvent, PlannerState> {
  final PlannerRepo _plannerRepo;
  PlannerBloc(this._plannerRepo) : super(PlannerLoading()) {
    on<MyDayEvent>((event, emit) async {
      emit(PlannerLoading());
      final result = await _plannerRepo.planner(event.userId);
      if (result != "user not found") {
        emit(PlannerSuccessful());
      }
      if (result == "user not found") {
        emit(PlannerError("Missing password OR  user not found"));
      }
    });
  }

}
