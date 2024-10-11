part of 'edit_kpi_bloc.dart';

abstract class EditKpiState extends Equatable {
  const EditKpiState();

  @override
  List<Object> get props => [];
}

class EditKpiInitial extends EditKpiState {}

class EditKpiLoading extends EditKpiState {}

class EditKpiLoaded extends EditKpiState {
  final Data editFormKpi;
  final int status;

  EditKpiLoaded(this.editFormKpi, this.status);

  @override
  List<Object> get props => [editFormKpi ?? [], status];
}

class EditKpiNoData extends EditKpiState {
  final String message;

  const EditKpiNoData(this.message);

  @override
  List<Object> get props => [message];
}

class EditKpiError extends EditKpiState {
  final String message;

  const EditKpiError(this.message);
}
