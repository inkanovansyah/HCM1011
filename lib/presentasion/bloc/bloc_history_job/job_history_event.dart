part of 'job_history_bloc.dart';

abstract class JobHistoryEvent extends Equatable {
  const JobHistoryEvent();

  @override
  List<Object> get props => [];
}

class GetListData extends JobHistoryEvent {
  const GetListData();
}
