part of 'bloc_satuan_bloc.dart';

abstract class SatuanEvent extends Equatable {
  const SatuanEvent();

  @override
  List<Object> get props => [];
}

class GetSatuanKpi extends SatuanEvent {
  const GetSatuanKpi();
}
