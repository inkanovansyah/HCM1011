import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm1011/presentasion/bloc/blov_type_leave/type_leave_bloc.dart';
import 'package:hcm1011/data/model/type_cuti.dart';

class TypeLeave extends StatefulWidget {
  final TextEditingController leaveTypeController;

  const TypeLeave({super.key, required this.leaveTypeController});

  @override
  State<TypeLeave> createState() => _TypeLeaveState();
}

class _TypeLeaveState extends State<TypeLeave> {
  String? selectedValue;

  @override
  void initState() {
    Future.microtask(
      () => context.read<TypeLeaveBloc>().add(const TypeLeaveEvent()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TypeLeaveBloc, TypeLeaveState>(
      builder: (context, state) {
        if (state is TypeLeaveLoading) {
          return Container(
            color: const Color.fromARGB(255, 245, 251, 255),
            height: 40,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is TypeLeaveLoaded) {
          if (state.typeofleavel != null) {
            Data? data = state.typeofleavel;

            if (data?.list != null && data!.list!.isNotEmpty) {
              List<ListElement> dataList = data.list!;

              return SizedBox(
                height: 50,
                child: DropdownButtonFormField<String>(
                  key: UniqueKey(),
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  items: dataList.map(
                    (type) {
                      var name = type.name ?? '';
                      return DropdownMenuItem<String>(
                        value: name,
                        child: Text(name),
                      );
                    },
                  ).toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(
                      () {
                        selectedValue = value;
                      },
                    );
                    widget.leaveTypeController.text = value ?? '';
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Silakan pilih nama';
                    }
                    return null;
                  },
                  isExpanded: true,
                ),
              );
            } else {
              return const Text('Format data tidak valid: List kosong');
            }
          } else {
            return const Text('Format data tidak valid: typeofleavel null');
          }
        } else if (state is TypeLeaveNoData) {
          return Text(state.message);
        } else if (state is TypeLeaveError) {
          return Text(state.message);
        } else {
          return Container();
        }
      },
    );
  }
}
