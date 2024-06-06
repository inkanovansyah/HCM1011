part of 'kpi_bloc.dart';

abstract class KpiState extends Equatable {
  const KpiState();

  @override
  List<Object> get props => [];
}

class KpiInitial extends KpiState {}

class KpiLoading extends KpiState {}

class KpiLoaded extends KpiState {
  final ModelDetailKpiData? dataKpi;
  final int? status;

  const KpiLoaded(this.dataKpi, this.status);
  @override
  List<Object> get props => [dataKpi ?? '', status ?? 0];
}

class KpiNoData extends KpiState {
  final String messages;
  const KpiNoData(this.messages);
  @override
  List<Object> get props => [messages];
}

class KpiError extends KpiState {
  final String messages;

  KpiError(this.messages);
  List<Object> get props => [messages];
}
