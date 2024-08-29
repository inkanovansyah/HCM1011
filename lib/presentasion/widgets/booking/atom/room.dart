import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm1011/data/model/room_type..dart';
import 'package:hcm1011/presentasion/bloc/bloc_type_room/room_type_bloc.dart';

class TypeRoom extends StatefulWidget {
  final TextEditingController roomController;

  const TypeRoom({super.key, required this.roomController});

  @override
  State<TypeRoom> createState() => _TypeRoomState();
}

class _TypeRoomState extends State<TypeRoom> {
  String? selectedValue;

  @override
  void initState() {
    Future.microtask(
      () => context.read<RoomTypeBloc>().add(const RoomTypeEvent()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomTypeBloc, RoomTypeState>(
      builder: (context, state) {
        if (state is RoomTypeLoading) {
          return Container(
            color: const Color.fromARGB(255, 245, 251, 255),
            height: 40,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is RoomTypeLoaded) {
          if (state.typeofroom != null) {
            if (state.typeofroom != null &&
                state.typeofroom!.data != null &&
                state.typeofroom!.data!.isNotEmpty) {
              List<Datum> dataList = state.typeofroom!.data!;

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
                    setState(() {
                      selectedValue = value;
                    });
                    widget.roomController.text = value ?? '';
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
        } else if (state is RoomTypeNoData) {
          return Text(state.message);
        } else if (state is RoomTypeError) {
          return Text(state.message);
        } else {
          return Container();
        }
      },
    );
  }
}
