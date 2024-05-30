import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/liststory.dart';
import 'package:hcm1011/data/service/api_list_story.dart';

part 'bloc_list_story_event.dart';
part 'bloc_list_story_state.dart';

class BlocListStoryBloc extends Bloc<BlocListStoryEvent, BlocListStoryState> {
  final ListStory listStory;

  BlocListStoryBloc({required this.listStory}) : super(BlocListStoryInitial()) {
    on<BlocListStoryEvent>((event, emit) async {
      try {
        emit(
          BlocListStoryLoading(),
        );
        final result = await listStory.fatchListStory();
        if (result.status == 200) {
          emit(
            BlocListStoryLoaded(result.data, result.status),
          );
        } else {
          emit(
            BlocListStoryNoData(result.status.toString()),
          );
        }
      } on FailureException catch (e) {
        emit(
          BlocListStoryError(e.message),
        );
      }
    });
  }
}
