part of 'myday_bloc.dart';


@immutable
abstract class MyDayEvent extends Equatable {}


class mydayEvent extends MyDayEvent{

  String? userId ;


  mydayEvent({this.userId});

  @override
  List<Object?> get props => [userId];

}