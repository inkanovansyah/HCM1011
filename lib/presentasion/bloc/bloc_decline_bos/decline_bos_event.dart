part of 'decline_bos_bloc.dart';

class DeclineBosEvent extends Equatable {
  const DeclineBosEvent();

  @override
  List<Object> get props => [];
}

class DeclineBos extends DeclineBosEvent {
  final String idDeclineLeave;
  DeclineBos({required this.idDeclineLeave});

  @override
  List<Object> get props => [idDeclineLeave];
}
