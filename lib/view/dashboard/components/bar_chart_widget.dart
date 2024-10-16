import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:simple_ehr/helper/responsive_helper.dart';
import 'package:simple_ehr/model/graph_model.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/utils/styles.dart';

import '../../../data/local/bar_data.dart';

class BarChartWidget extends StatefulWidget {

  final Color chartColor;
  final BarData chartData;

  const BarChartWidget({super.key, required this.chartColor, required this.chartData});

  @override
  State<BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  int? touchedIndex;


  @override
  Widget build(BuildContext context) {

    return BarChart(
        BarChartData(
          barGroups: _chartGroups(points: widget.chartData.data, color: widget.chartColor),
          borderData: FlBorderData(border: const Border()),
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final isTouched = touchedIndex == value.toInt();
                  return Padding(
                      padding: EdgeInsets.only(top: 5),
                    child: Text(
                      widget.chartData.bottomLabel[value.toInt()],
                      style: TextStyle(
                          color: isTouched ? textColor : lightGreyColor,
                          fontWeight: interRegular.fontWeight
                      ),
                    ),
                  );
                }
              )
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          barTouchData: BarTouchData(
            touchCallback: (FlTouchEvent event, barTouchResponse) {
              if (barTouchResponse != null && barTouchResponse.spot != null) {
                setState(() {
                  touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
                });
              } else {
                setState(() {
                  touchedIndex = -1; // Reset if no bar is touched
                });
              }
            },
            touchTooltipData: BarTouchTooltipData(
               // Customize the tooltip background color
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                String label = widget.chartData.bottomLabel[group.x.toInt()];
                return BarTooltipItem(
                  '$label\n${rod.toY} Patients',
                  TextStyle(
                      color: Colors.white,
                      fontWeight: interRegular.fontWeight,
                    fontSize: 12
                  ),
                );
              },
            ),
          ),
        )
    );



  }

  List<BarChartGroupData> _chartGroups({
    required List<GraphModel> points,
    required Color color,
  }) {
    return points
        .map(
          (point) => BarChartGroupData(
        x: point.x.toInt(),
        barRods: [
          BarChartRodData(
            toY: point.y,
            width: ResponsiveHelper.isDesktop(context) ? 55 : 35,
            color: touchedIndex == point.x.toInt()
                ? blueColor // Change color on hover or click
                : color, // Default color
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0),
            ),
          ),
        ],
      ),
    )
        .toList();
  }
}