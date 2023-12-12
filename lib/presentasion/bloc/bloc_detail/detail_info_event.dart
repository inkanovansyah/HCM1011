part of 'detail_info_bloc.dart';

abstract class DetailInfoEvent extends Equatable {
  const DetailInfoEvent();

  @override
  List<Object> get props => [];
}

class GetDetailInfo extends DetailInfoEvent {
  final String info_id;
  const GetDetailInfo(this.info_id);

  @override
  List<Object> get props => [info_id];
}
