part of 'list_info_bloc.dart';

abstract class ListInfoEvent extends Equatable {
  const ListInfoEvent();

  @override
  List<Object> get props => [];
}

class GetList extends ListInfoEvent {
  const GetList();
}
