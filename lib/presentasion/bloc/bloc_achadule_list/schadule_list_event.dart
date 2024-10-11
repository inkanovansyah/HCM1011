part of 'schadule_list_bloc.dart';

abstract class SchaduleListEvent extends Equatable {
  const SchaduleListEvent();

  @override
  List<Object> get props => [];
}

class GetSchaduleList extends SchaduleListEvent {
  const GetSchaduleList();
}
