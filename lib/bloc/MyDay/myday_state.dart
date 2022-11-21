part of 'myday_bloc.dart';

@immutable
abstract class MyDayState extends Equatable {}

class MyDayInitial extends MyDayState {
  @override
  List<Object?> get props => [];
}

class MyDaySuccessful extends MyDayState {
  final Planner_model planner_model;

  MyDaySuccessful(this.planner_model);

  @override
  List<Object?> get props => [planner_model];
}

class MyDayLoading extends MyDayState {
  @override
  List<Object?> get props => [];
}

class MyDayError extends MyDayState {
  String? msgError;

  MyDayError(this.msgError);

  @override
  List<Object?> get props => [msgError];
}
