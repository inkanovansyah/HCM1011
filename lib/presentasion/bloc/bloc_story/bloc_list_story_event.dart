part of 'bloc_list_story_bloc.dart';

abstract class BlocListStoryEvent extends Equatable {
  const BlocListStoryEvent();

  @override
  List<Object> get props => [];
}

class Fetchlist extends BlocListStoryEvent {
  const Fetchlist();
}
