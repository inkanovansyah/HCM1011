// import 'dart:io';
// import 'package:image/image.dart' as img;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/model/addAttandance.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/service/api_attandance.dart';

part 'bloc_attandance_event.dart';
part 'bloc_attandance_state.dart';

class BlocAttandanceBloc
    extends Bloc<BlocAttandanceEvent, BlocAttandanceState> {
  final ApiAttandanceAdd Applyattandance;

  BlocAttandanceBloc({
    required this.Applyattandance,
  }) : super(BlocAttandanceInitial()) {
    on<AddAttandanceSubmit>(
      (event, emit) async {
        try {
          emit(BlocAttandanceLoading());
          final source = event.source;

          final lat = event.lat;
          final long = event.long;
          final location = event.location;

          final result = await Applyattandance.fatchDataApplyAttandance(
            source,
            lat,
            long,
            location,
          );

          if (result.data != null && result.status == 200) {
            emit(BlocAttandanceLoaded(
                result, result.messages?.toString(), result.status ?? 0));
          } else {
            emit(BlocAttandanceNoData(result.messages.toString()));
          }
        } on FailureException catch (e) {
          emit(BlocAttandanceError(e.message));
        }
      },
    );
  }
}
