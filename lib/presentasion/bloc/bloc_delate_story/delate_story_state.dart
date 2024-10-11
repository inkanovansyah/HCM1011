part of 'delate_story_bloc.dart';

abstract class DelateStoryState extends Equatable {
  const DelateStoryState();

  @override
  List<Object> get props => [];
}

class DelateStoryInitial extends DelateStoryState {}

class DelateStoryLoading extends DelateStoryState {}

class DelateStoryLoaded extends DelateStoryState {
  final Data? deleteStory;
  final int status;

  const DelateStoryLoaded(this.deleteStory, this.status);

  @override
  List<Object> get props => [deleteStory ?? [], status];
}

class DelateStoryNoData extends DelateStoryState {
  final String message;
  const DelateStoryNoData(this.message);

  @override
  List<Object> get props => [message];
}

class DelateStoryError extends DelateStoryState {
  final String message;
  const DelateStoryError(this.message);
  @override
  List<Object> get props => [message];
}
