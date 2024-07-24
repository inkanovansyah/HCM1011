part of 'submit_gs_bloc.dart';

abstract class SubmitdataEvent extends Equatable {
  const SubmitdataEvent();

  @override
  List<Object> get props => [];
}

class SubmitGsEvent extends SubmitdataEvent {
  const SubmitGsEvent();
}
