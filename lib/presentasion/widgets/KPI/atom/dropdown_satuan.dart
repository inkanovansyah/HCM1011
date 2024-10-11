import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_satuan/bloc_satuan_bloc.dart';

class DropdownSatuan extends StatefulWidget {
  final Function(String?)? onChanged;

  const DropdownSatuan({Key? key, this.onChanged}) : super(key: key);

  @override
  State<DropdownSatuan> createState() => _satuanDropdown();
}

class _satuanDropdown extends State<DropdownSatuan> {
  String? selectedValue;
  @override
  void initState() {
    Future.microtask(
      () => context.read<BlocSatuanBloc>().add(const GetSatuanKpi()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocSatuanBloc, SatuanState>(builder: (context, state) {
      if (state is SatuanLoading) {
        return Container(
          color: Color.fromARGB(
              255, 245, 251, 255), // Tambahkan latar belakang putih di sini
          height: 40, // Tambahkan ketinggian di sini
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (state is SatuanLoaded) {
        return SizedBox(
          height: 50, // Tinggi tetap 300 pixel
          width: 160,
          child: SingleChildScrollView(
            child: DropdownButtonFormField<String>(
              key: UniqueKey(), // Add a unique key to force rebuild
              decoration: InputDecoration(
                fillColor: Colors.grey[200],
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              items: state.dataSatuan?.map((satuan) {
                return DropdownMenuItem<String>(
                  value: satuan.name ?? '',
                  child: Text(satuan.name ?? ''),
                );
              }).toList(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
                widget.onChanged?.call(value);
                print(value); // Example: print the selected value
              },
              isExpanded: true,
            ),
          ),
        );
      } else if (state is SatuanError) {
        return Text(state.messages);
      } else {
        return SizedBox.shrink(); // Tidak menampilkan apapun
      }
    });
  }
}
