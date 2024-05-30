part of 'bloc_list_story_bloc.dart';

class BlocListStoryState extends Equatable {
  const BlocListStoryState();

  @override
  List<Object> get props => [];
}

class BlocListStoryInitial extends BlocListStoryState {}

class BlocListStoryLoading extends BlocListStoryState {}

class BlocListStoryLoaded extends BlocListStoryState {
  final List<Datums>? storyList;
  final int? status;

  const BlocListStoryLoaded(this.storyList, this.status);
  @override
  List<Object> get props => [storyList ?? '', status ?? 0];
}

class BlocListStoryNoData extends BlocListStoryState {
  final String message;
  const BlocListStoryNoData(this.message);
  @override
  List<Object> get props => [message];
}

class BlocListStoryError extends BlocListStoryState {
  final String message;

  BlocListStoryError(this.message);
  List<Object> get props => [message];
}
