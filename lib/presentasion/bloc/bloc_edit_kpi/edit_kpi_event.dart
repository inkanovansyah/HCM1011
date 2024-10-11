part of 'edit_kpi_bloc.dart';

class EditKpiEvent extends Equatable {
  const EditKpiEvent();

  @override
  List<Object> get props => [];
}

class EditKpi extends EditKpiEvent {
  final String editkpi_id;
  const EditKpi(this.editkpi_id);

  @override
  List<Object> get props => [editkpi_id];
}
