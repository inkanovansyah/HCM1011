part of 'form_detail_id_bloc.dart';

abstract class FormDetailIdState extends Equatable {
  const FormDetailIdState();

  @override
  List<Object> get props => [];
}

class FormDetailIdInitial extends FormDetailIdState {}

class FormDetailIdLoading extends FormDetailIdState {}

class FormDetailIdLoaded extends FormDetailIdState {
  final Data editFormGS;
  final int status;

  FormDetailIdLoaded(this.editFormGS, this.status);

  @override
  List<Object> get props => [editFormGS ?? [], status];
}

class FormDetailIdNoData extends FormDetailIdState {
  final String message;

  const FormDetailIdNoData(this.message);
  @override
  List<Object> get props => [message];
}

class FormDetailIdError extends FormDetailIdState {
  final String message;

  const FormDetailIdError(this.message);
  List<Object> get props => [message];
}
