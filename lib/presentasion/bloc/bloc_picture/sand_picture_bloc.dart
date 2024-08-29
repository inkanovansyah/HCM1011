import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sand_picture_event.dart';
part 'sand_picture_state.dart';

class SandPictureBloc extends Bloc<SandPictureEvent, SandPictureState> {
  SandPictureBloc() : super(SandPictureInitial()) {
    on<SandPictureEvent>((event, emit) async {});
  }
}
