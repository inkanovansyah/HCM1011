import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class ChartKpi extends StatefulWidget {
  ChartKpi(this.year, this.sales, this.profit);
  final String year;
  final double sales;
  final double profit;
  @override
  State<ChartKpi> createState() => _ChartKpiState();
}

class _ChartKpiState extends State<ChartKpi> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 10), // Add 20 pixels margin on both sides
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Bentuk border card
        ), // Card elevation for a shadow effect
        child: SfCartesianChart(
          title: ChartTitle(text: 'Performance'),
          primaryXAxis: CategoryAxis(),
          axes: <ChartAxis>[
            NumericAxis(
              opposedPosition: true,
              name: 'yAxis1',
              title: AxisTitle(text: 'Key Value'),
            ),
            NumericAxis(
              name: 'yAxis2',
              title: AxisTitle(text: 'Key Value'),
            ),
          ],
          series: <ChartSeries>[
            LineSeries<ChartKpi, String>(
              dataSource: <ChartKpi>[
                ChartKpi('EPM', 35, 30),
                ChartKpi('KPI', 28, 34),
                ChartKpi('Leave', 34, 28),
                ChartKpi('Training', 32, 36),
                ChartKpi('Attan', 40, 32),
              ],
              xValueMapper: (ChartKpi point, _) => point.year,
              yValueMapper: (ChartKpi point, _) => point.sales,
              yAxisName: 'yAxis1',
              name: 'Primary Axis',
            ),
            LineSeries<ChartKpi, String>(
              dataSource: <ChartKpi>[
                ChartKpi('EPM', 35, 30),
                ChartKpi('KPI', 28, 34),
                ChartKpi('Leave', 34, 28),
                ChartKpi('Training', 32, 36),
                ChartKpi('Attan', 40, 32),
              ],
              xValueMapper: (ChartKpi point, _) => point.year,
              yValueMapper: (ChartKpi point, _) => point.profit,
              yAxisName: 'yAxis2',
              name: 'Secondary Axis',
            ),
          ],
        ),
      ),
    );
  }
}
