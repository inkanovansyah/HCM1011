part of 'list_info_bloc.dart';

abstract class ListInfoState extends Equatable {
  const ListInfoState();

  @override
  List<Object> get props => [];
}

class ListInfoInitial extends ListInfoState {}

class ListInfoLoading extends ListInfoState {}

class ListInfoLoaded extends ListInfoState {
  final List<Datum>? infoList;
  final int? status;

  const ListInfoLoaded(this.infoList, this.status);

  @override
  List<Object> get props => [infoList ?? '', status ?? 0];
}

class ListInfoNoData extends ListInfoState {
  final String message;
  const ListInfoNoData(this.message);
  @override
  List<Object> get props => [message];
}

class ListInfoError extends ListInfoState {
  final String message;

  ListInfoError(this.message);
  List<Object> get props => [message];
}
