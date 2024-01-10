part of 'kpi_bloc.dart';

abstract class KpiEvent extends Equatable {
  const KpiEvent();

  @override
  List<Object> get props => [];
}

class GetListKpi extends KpiEvent {
  const GetListKpi();
}
