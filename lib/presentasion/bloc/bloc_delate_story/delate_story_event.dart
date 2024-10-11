part of 'delate_story_bloc.dart';

abstract class DelateStoryEvent extends Equatable {
  const DelateStoryEvent();

  @override
  List<Object> get props => [];
}

class DeleteStory extends DelateStoryEvent {
  final String id;

  const DeleteStory({required this.id});

  @override
  List<Object> get props => [id];
}
