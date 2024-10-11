import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hcm1011/presentasion/bloc/bloc_replactment/replacment_bloc.dart';
import 'package:hcm1011/data/model/replacment.dart';

class Replacement extends StatefulWidget {
  final TextEditingController ReplacmentController;
  const Replacement({super.key, required this.ReplacmentController});

  @override
  State<Replacement> createState() => _ReplacementState();
}

class _ReplacementState extends State<Replacement> {
  String? selectedValue;

  @override
  void initState() {
    Future.microtask(
      () => context.read<ReplacmentBloc>().add(ReplacmentEvent()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReplacmentBloc, ReplacmentState>(
      builder: (context, state) {
        if (state is ReplacmentLoading) {
          return Container(
            color: const Color.fromARGB(255, 245, 251, 255),
            height: 40,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is ReplacmentLoaded) {
          if (state.data != null) {
            Data? data = state.data;

            if (data?.data != null && data!.data!.isNotEmpty) {
              List<Datum> dataList = data.data!;
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
                    (datum) {
                      var fullname = datum.fullname ?? '';
                      return DropdownMenuItem<String>(
                        value: fullname,
                        child: Text(fullname),
                      );
                    },
                  ).toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(
                      () {
                        selectedValue = value;
                        widget.ReplacmentController.text = selectedValue!;
                      },
                    );
                    widget.ReplacmentController.text = value ?? '';
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Pilih Replacment';
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
            return const Text('Format data tidak valid: data null');
          }
        } else if (state is ReplacmentNoData) {
          return Text(state.message);
        } else if (state is ReplacmentError) {
          return Text(state.message);
        } else {
          return Container();
        }
      },
    );
  }
}
