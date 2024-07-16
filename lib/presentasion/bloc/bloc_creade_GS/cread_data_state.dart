part of 'cread_data_bloc.dart';

abstract class CreadDataState extends Equatable {
  const CreadDataState();

  @override
  List<Object?> get props => [];
}

class CreadDataInitial extends CreadDataState {}

class CreadDataLoading extends CreadDataState {}

class CreadDataLoaded extends CreadDataState {
  final Data detailList;
  final int status;

  CreadDataLoaded(this.detailList, this.status);

  @override
  List<Object?> get props => [detailList ?? [], status];
}

class CreadDataNoData extends CreadDataState {
  final String message;
  const CreadDataNoData(this.message);
  @override
  List<Object> get props => [message];
}

class CreadDataError extends CreadDataState {
  final String message;

  CreadDataError(this.message);
  List<Object> get props => [message];
}
