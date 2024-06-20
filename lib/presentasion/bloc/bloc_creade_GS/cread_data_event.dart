part of 'cread_data_bloc.dart';

abstract class DetailInfoEvent extends Equatable {
  const DetailInfoEvent();

  @override
  List<Object> get props => [];
}

class CreadDataEvent extends Equatable {
  final String jobs_desc;
  final String target;
  final String satuan_target;
  final String section;
  final String code_section;
  const CreadDataEvent(this.code_section, this.jobs_desc, this.target,
      this.satuan_target, this.section);

  @override
  List<Object> get props =>
      [code_section, jobs_desc, target, satuan_target, section];
}
