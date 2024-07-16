part of 'cread_data_bloc.dart';

abstract class CreadDataEvent extends Equatable {
  const CreadDataEvent();

  @override
  List<Object> get props => [];
}

class SubmitDataEvent extends CreadDataEvent {
  final String jobDesc;
  final String target;
  final String bobot;
  final String satuanTarget;
  final String sesionId;

  const SubmitDataEvent({
    required this.jobDesc,
    required this.target,
    required this.bobot,
    required this.satuanTarget,
    required this.sesionId,
  });

  @override
  List<Object> get props => [jobDesc, bobot, target, satuanTarget, sesionId];
}
