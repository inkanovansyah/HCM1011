part of 'job_history_bloc.dart';

class JobHistoryState extends Equatable {
  const JobHistoryState();

  @override
  List<Object> get props => [];
}

class JobHistoryInitial extends JobHistoryState {}

class JobHistoryLoading extends JobHistoryState {}

class JobHistoryLoaded extends JobHistoryState {
  final Data? data;
  final int? status;

  const JobHistoryLoaded(this.data, this.status);
  @override
  List<Object> get props => [data ?? '', status ?? 0];
}

class JobHistoryError extends JobHistoryState {
  final String messages;
  const JobHistoryError(this.messages);
  @override
  List<Object> get props => [messages];
}

class JobHistoryNoData extends JobHistoryState {
  final String messages;
  const JobHistoryNoData(this.messages);
  @override
  List<Object> get props => [messages];
}
