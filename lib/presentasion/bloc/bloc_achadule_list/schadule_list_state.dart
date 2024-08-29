part of 'schadule_list_bloc.dart';

class SchaduleListState extends Equatable {
  const SchaduleListState();

  @override
  List<Object> get props => [];
}

class SchaduleListInitial extends SchaduleListState {}

class SchaduleListLoading extends SchaduleListState {}

class SchaduleListLoaded extends SchaduleListState {
  final Data? data;
  final int? status;

  const SchaduleListLoaded(this.data, this.status);
  @override
  List<Object> get props => [data ?? '', status ?? 0];
}

class SchaduleListError extends SchaduleListState {
  final String messages;
  const SchaduleListError(this.messages);
  @override
  List<Object> get props => [messages];
}

class SchaduleListNoData extends SchaduleListState {
  final String messages;
  const SchaduleListNoData(this.messages);
  @override
  List<Object> get props => [messages];
}
