import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:simple_ehr/data/local/pie_data.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});



  @override
  Widget build(BuildContext context) {
    final pieChartData = PieData();
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
              PieChartData(
                sectionsSpace: 0,
                centerSpaceRadius: 70,
                startDegreeOffset: -90,
                sections: pieChartData.pieChartSelectionData,

              )
          )
        ],
      ),
    );
  }


}