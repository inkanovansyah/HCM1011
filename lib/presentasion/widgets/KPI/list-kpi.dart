import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/widgets/KPI/card_kpi.dart';

class CardKpi extends StatefulWidget {
  const CardKpi({super.key});

  @override
  State<CardKpi> createState() => _CardKpi();
}

class _CardKpi extends State<CardKpi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffEEF2FD),
      padding: EdgeInsets.only(bottom: 40),
      child: CardKPI(),
    );
  }
}
