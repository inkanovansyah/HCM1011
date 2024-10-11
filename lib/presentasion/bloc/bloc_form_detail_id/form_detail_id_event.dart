part of 'form_detail_id_bloc.dart';

abstract class FormDetailIdEvent extends Equatable {
  const FormDetailIdEvent();

  @override
  List<Object> get props => [];
}

class GetfromId extends FormDetailIdEvent {
  final String edit_id;
  const GetfromId(this.edit_id);

  @override
  List<Object> get props => [edit_id];
}
