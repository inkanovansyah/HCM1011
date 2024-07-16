import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_kpi/kpi_bloc.dart';

class FormCode extends StatefulWidget {
  final TextEditingController sessionIdController;

  FormCode({Key? key, required this.sessionIdController}) : super(key: key);

  @override
  State<FormCode> createState() => _FormCodeState();
}

class _FormCodeState extends State<FormCode> {
  @override
  void initState() {
    super.initState();
    context.read<KpiBloc>().add(const GetListKpi());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KpiBloc, KpiState>(
      builder: (context, state) {
        if (state is KpiLoading) {
          return Container(
            color: Color.fromARGB(255, 245, 251, 255),
            height: 30,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is KpiLoaded) {
          final sectionId = state.dataKpi?.data?.isNotEmpty == true
              ? state.dataKpi!.data![0].sectionId ?? ''
              : '';

          widget.sessionIdController.text = sectionId;

          return Visibility(
            visible: sectionId.isNotEmpty, // Change this condition as needed
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: TextFormField(
                controller: widget.sessionIdController,
                decoration: InputDecoration(
                  labelText: 'Session Unik',
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          );
        } else {
          return Container(
            color: Color(0xffEEF2FD),
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Text(
                  'Terjadi kesalahan.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
