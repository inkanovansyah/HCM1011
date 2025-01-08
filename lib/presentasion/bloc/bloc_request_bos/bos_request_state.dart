part of 'bos_request_bloc.dart';

class BosRequestState extends Equatable {
  const BosRequestState();

  @override
  List<Object> get props => [];
}

class BosRequestInitial extends BosRequestState {}

class BosRequestLoading extends BosRequestState {}

class BosRequestLoaded extends BosRequestState {
  final Data? listRequest;
  final int? status;
  final String? messages;

  const BosRequestLoaded(this.listRequest, this.status, this.messages);

  @override
  List<Object> get props => [listRequest ?? [], status!, messages!];
}

class BosRequestNoData extends BosRequestState {
  final String message;

  const BosRequestNoData(this.message);

  @override
  List<Object> get props => [message];
}

class BosRequestError extends BosRequestState {
  final String message;

  const BosRequestError(this.message);

  @override
  List<Object> get props => [message];
}
