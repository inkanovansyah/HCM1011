part of 'replacment_bloc.dart';

class ReplacmentState extends Equatable {
  const ReplacmentState();

  @override
  List<Object> get props => [];
}

class ReplacmentInitial extends ReplacmentState {}

class ReplacmentLoading extends ReplacmentState {}

class ReplacmentLoaded extends ReplacmentState {
  final Data? data;
  final int status;

  const ReplacmentLoaded(this.data, this.status);

  @override
  List<Object> get props => [data ?? [], status];
}

class ReplacmentNoData extends ReplacmentState {
  final String message;
  const ReplacmentNoData(this.message);
  @override
  List<Object> get props => [message];
}

class ReplacmentError extends ReplacmentState {
  final String message;
  const ReplacmentError(this.message);
  @override
  List<Object> get props => [message];
}
