part of 'bloc_satuan_bloc.dart';

class SatuanState extends Equatable {
  const SatuanState();

  @override
  List<Object> get props => [];
}

class SatuanInitial extends SatuanState {}

class SatuanLoading extends SatuanState {}

class SatuanLoaded extends SatuanState {
  final List<Datum>? dataSatuan;
  final int? status;

  const SatuanLoaded(this.dataSatuan, this.status);
  @override
  List<Object> get props => [dataSatuan ?? '', status ?? 0];
}

class SatuanNoData extends SatuanState {
  final String messages;
  const SatuanNoData(this.messages);
  @override
  List<Object> get props => [messages];
}

class SatuanError extends SatuanState {
  final String messages;

  SatuanError(this.messages);
  List<Object> get props => [messages];
}
