part of 'type_leave_bloc.dart';

class TypeLeaveState extends Equatable {
  const TypeLeaveState();

  @override
  List<Object> get props => [];
}

class TypeLeaveInitial extends TypeLeaveState {}

class TypeLeaveLoading extends TypeLeaveState {}

class TypeLeaveLoaded extends TypeLeaveState {
  final Data? typeofleavel;
  final int status;

  TypeLeaveLoaded(this.typeofleavel, this.status);
  @override
  List<Object> get props => [typeofleavel ?? 0, status];
}

class TypeLeaveNoData extends TypeLeaveState {
  final String message;
  const TypeLeaveNoData(this.message);
  @override
  List<Object> get props => [message];
}

class TypeLeaveError extends TypeLeaveState {
  final String message;
  TypeLeaveError(this.message);
  @override
  List<Object> get props => [message];
}
