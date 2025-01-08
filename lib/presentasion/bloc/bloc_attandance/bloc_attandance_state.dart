part of 'bloc_attandance_bloc.dart';

class BlocAttandanceState extends Equatable {
  const BlocAttandanceState();

  @override
  List<Object> get props => [];
}

class BlocAttandanceInitial extends BlocAttandanceState {}

class BlocAttandanceLoading extends BlocAttandanceState {}

class BlocAttandanceLoaded extends BlocAttandanceState {
  final ApplyAttandance? applyAttandance;
  final String? messages;
  final int status;

  const BlocAttandanceLoaded(this.applyAttandance, this.messages, this.status);

  @override
  List<Object> get props => [applyAttandance ?? [], messages ?? [], status];
}

class BlocAttandanceNoData extends BlocAttandanceState {
  final String messages;
  const BlocAttandanceNoData(this.messages);

  @override
  List<Object> get props => [messages];
}

class BlocAttandanceError extends BlocAttandanceState {
  final String? messages;

  const BlocAttandanceError(this.messages);

  @override
  List<Object> get props => [messages ?? ''];
}
