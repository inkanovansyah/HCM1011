part of 'list_bloc.dart';

// event.dart
abstract class ListState extends Equatable {
  const ListState();
  @override
  List<Object> get props => [];
}

class InfoInitial extends ListState {}

class InfoLoading extends ListState {}

class InfoLoaded extends ListState {
  final List<Datum> infoList;
  final int status;

  const InfoLoaded(this.infoList, this.status);

  @override
  List<Object> get props => [infoList, status];
}

class InfoNoData extends ListState {
  final String message;
  const InfoNoData(this.message);
  @override
  List<Object> get props => [message];
}

class InfoError extends ListState {
  final String message;

  InfoError(this.message);
  List<Object> get props => [message];
}
