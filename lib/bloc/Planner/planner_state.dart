part of 'planner_bloc.dart';

@immutable
abstract class PlannerState extends Equatable {}

class PlannerInitial extends PlannerState {
  @override
  List<Object?> get props => [];
}

class PlannerSuccessful extends PlannerState {
  @override
  List<Object?> get props => [];
}

class PlannerLoading extends PlannerState {
  @override
  List<Object?> get props => [];
}

class PlannerError extends PlannerState {
  String? msgError;
  PlannerError(this.msgError);
  @override
  List<Object?> get props => [msgError];
}
