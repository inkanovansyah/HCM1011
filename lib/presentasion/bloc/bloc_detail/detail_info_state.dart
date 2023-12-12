part of 'detail_info_bloc.dart';

abstract class DetailInfoState extends Equatable {
  const DetailInfoState();

  @override
  List<Object?> get props => [];
}

class DetailInfoInitial extends DetailInfoState {}

class DetailInfoLoading extends DetailInfoState {}

class DetailInfoLoaded extends DetailInfoState {
  final Data detailList;
  final int status;

  DetailInfoLoaded(this.detailList, this.status);

  @override
  List<Object?> get props => [detailList ?? [], status];
}

class DetailInfoNoData extends DetailInfoState {
  final String message;
  const DetailInfoNoData(this.message);
  @override
  List<Object> get props => [message];
}

class DetailInfoError extends DetailInfoState {
  final String message;

  DetailInfoError(this.message);
  List<Object> get props => [message];
}
