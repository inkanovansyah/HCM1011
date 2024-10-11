part of 'car_type_bloc.dart';

class CarTypeState extends Equatable {
  const CarTypeState();

  @override
  List<Object> get props => [];
}

class CarTypeInitial extends CarTypeState {}

class CarTypeLoading extends CarTypeState {}

class CarTypeLoaded extends CarTypeState {
  final List<Datum>? typeofcar;
  final int status;

  CarTypeLoaded(this.typeofcar, this.status);
  @override
  List<Object> get props => [typeofcar ?? 0, status];
}

class CarTypeNoData extends CarTypeState {
  final String message;
  const CarTypeNoData(this.message);
  @override
  List<Object> get props => [message];
}

class CarTypeError extends CarTypeState {
  final String message;
  CarTypeError(this.message);
  @override
  List<Object> get props => [message];
}
