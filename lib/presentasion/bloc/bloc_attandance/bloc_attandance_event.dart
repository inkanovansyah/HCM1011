part of 'bloc_attandance_bloc.dart';

class BlocAttandanceEvent extends Equatable {
  const BlocAttandanceEvent();

  @override
  List<Object> get props => [];
}

class AddAttandanceSubmit extends BlocAttandanceEvent {
  final String source;
  final String lat;
  final String long;
  final String location;

  const AddAttandanceSubmit({
    required this.source,
    required this.lat,
    required this.long,
    required this.location,
  });

  @override
  List<Object> get props => [
        source,
        lat,
        long,
        location,
      ];
}
