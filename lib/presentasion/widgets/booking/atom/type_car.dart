import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm1011/data/model/typecar.dart'; // Ensure the import path is correct
import 'package:hcm1011/presentasion/bloc/bloc_car_type/car_type_bloc.dart';

class TypeCar extends StatefulWidget {
  final TextEditingController typeCarController;

  const TypeCar({super.key, required this.typeCarController});

  @override
  State<TypeCar> createState() => _TypeCarState();
}

class _TypeCarState extends State<TypeCar> {
  String? selectedId;

  @override
  void initState() {
    super.initState();
    // Request data when widget is initialized
    Future.microtask(
      () => context.read<CarTypeBloc>().add(const CarTypeDataEvent()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarTypeBloc, CarTypeState>(
      builder: (context, state) {
        if (state is CarTypeLoading) {
          return Container(
            color: const Color.fromARGB(255, 245, 251, 255),
            height: 40,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is CarTypeLoaded) {
          // Access the list of Datum directly from typeofcar
          if (state.typeofcar != null && state.typeofcar!.isNotEmpty) {
            List<Datum> dataList = state.typeofcar!;

            return SizedBox(
              height: 50,
              child: DropdownButtonFormField<String>(
                key: UniqueKey(),
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Select Type Car',
                ),
                items: dataList.map(
                  (Datum type) {
                    return DropdownMenuItem<String>(
                      value: type.id ?? '', // Use id as the value
                      child: Text(type.nama ?? ''), // Display nama
                    );
                  },
                ).toList(),
                value: selectedId,
                onChanged: (String? value) {
                  setState(() {
                    selectedId = value;
                  });
                  widget.typeCarController.text = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
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
        } else if (state is CarTypeNoData) {
          return Text(state.message);
        } else if (state is CarTypeError) {
          return Text(state.message);
        } else {
          return Container();
        }
      },
    );
  }
}
