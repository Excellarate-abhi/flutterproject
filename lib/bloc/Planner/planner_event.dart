part of 'planner_bloc.dart';

@immutable
abstract class PlannerEvent extends Equatable {}


class MyDayEvent extends PlannerEvent{

  String? userId ;


  MyDayEvent({this.userId});

  @override
  List<Object?> get props => [userId];

}