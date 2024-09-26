import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:simple_ehr/utils/constant.dart';


class PieData {

  final pieChartSelectionData = [
    PieChartSectionData(
      color: primaryColor,
      value: 25,
      showTitle: false,
      radius: 25
    ),
    PieChartSectionData(
        color: greenColor,
        value: 10,
        showTitle: false,
        radius: 19
    ),
    PieChartSectionData(
        color: redColor,
        value: 15,
        showTitle: false,
        radius: 16
    ),
    PieChartSectionData(
        color: orangeColor,
        value: 20,
        showTitle: false,
        radius: 22
    ),
  ];

}


