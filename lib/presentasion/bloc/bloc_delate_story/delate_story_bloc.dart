import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/deleteStory.dart';
import 'package:hcm1011/data/service/api_delete_story.dart';

part 'delate_story_event.dart';
part 'delate_story_state.dart';

class DelateStoryBloc extends Bloc<DelateStoryEvent, DelateStoryState> {
  final DeleteStoryList apiDeleteStory;

  DelateStoryBloc({required this.apiDeleteStory})
      : super(DelateStoryInitial()) {
    on<DeleteStory>(
      (event, emit) async {
        try {
          emit(DelateStoryLoading());

          final id = event.id;

          final result = await apiDeleteStory.fatchDeleteStory(id);
          if (result.data != null && result.status == 200) {
            emit(DelateStoryLoaded(result.data, result.status ?? 0));
          } else {
            emit(DelateStoryNoData(result.status.toString()));
          }
        } on FailureException catch (e) {
          emit(DelateStoryError(e.message));
        }
      },
    );
  }
}
