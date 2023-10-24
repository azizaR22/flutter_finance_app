import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Charts extends StatelessWidget {
  final List<SalesData> data = [
    SalesData(100, 'mon'),
    SalesData(20, 'Tue'),
    SalesData(40, 'Wed'),
    SalesData(15, 'Sat'),
    SalesData(5, 'Sun'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <SplineSeries<SalesData, String>>[
          SplineSeries<SalesData, String>(
            color: Color.fromARGB(255, 47, 125, 121),
            width: 4,
            dataSource: data,
            xValueMapper: (SalesData sales, _) => sales.day,
            yValueMapper: (SalesData sales, _) => sales.sales,
          ),
        ],
      ),
    );
  }
}

class SalesData {
  final double sales;
  final String day;

  SalesData(this.sales, this.day);
}
