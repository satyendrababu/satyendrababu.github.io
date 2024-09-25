
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';

class PatientBarChart extends StatelessWidget {
  //final List<charts.Series<dynamic, String>>? seriesList;
  //final bool? animate;

  //PatientBarChart(this.seriesList, {this.animate});

  /*factory PatientBarChart.withSampleData() {
    return PatientBarChart(
      _createSampleData(),
      animate: false, // Disable animations for testing
    );
  }*/


  @override
  Widget build(BuildContext context) {
    return  Container();
  }
  /*static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      OrdinalSales('2014', 5),
      OrdinalSales('2015', 25),
      OrdinalSales('2016', 100),
      OrdinalSales('2017', 75),
      OrdinalSales('2018', 33),
      OrdinalSales('2019', 80),
      OrdinalSales('2020', 21),
      OrdinalSales('2021', 77),
      OrdinalSales('2022', 8),
      OrdinalSales('2023', 12),
      OrdinalSales('2024', 42),
      OrdinalSales('2025', 70),
      OrdinalSales('2026', 77),
      OrdinalSales('2027', 55),
      OrdinalSales('2028', 19),
      OrdinalSales('2029', 66),
      OrdinalSales('2030', 27),
    ];

    *//*return [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];*//*
  }*/

}


class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}