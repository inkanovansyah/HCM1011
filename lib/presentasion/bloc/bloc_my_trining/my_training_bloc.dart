import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/model/trining.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/service/my-trening.dart';

part 'my_training_event.dart';
part 'my_training_state.dart';

class MyTrainingBloc extends Bloc<MyTrainingEvent, MyTrainingState> {
  final MyTrining apiMyTrining;
  MyTrainingBloc({
    required this.apiMyTrining,
  }) : super(MyTrainingInitial()) {
    on<MyTrainingEvent>(
      (event, emit) async {
        try {
          emit(
            MyTriningLoading(),
          );
          final result = await apiMyTrining.fatchListTrining();
          if (result.status == 200) {
            emit(
              MyTriningLoaded(result.data, result.status),
            );
          } else {
            emit(
              MyTriningNoData(result.status.toString()),
            );
          }
        } on FailureException catch (e) {
          emit(
            MyTriningError(e.message),
          );
        }
      },
    );
  }
}
