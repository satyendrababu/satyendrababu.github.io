import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:simple_ehr/data/local/line_data.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/view/dashboard/components/custome_card_widget.dart';

class LineChartWidget extends StatelessWidget {

  final Color chartColor;
  final LineData chartData;

  const LineChartWidget({super.key, required this.chartColor, required this.chartData});

  @override
  Widget build(BuildContext context) {

    return LineChart(
      LineChartData(
        lineTouchData: const LineTouchData(
          handleBuiltInTouches: true,
        ),
        gridData: const FlGridData(show: false),
        titlesData: FlTitlesData(
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
              getTitlesWidget: (double value, TitleMeta meta) {
                return chartData.bottomTitle[value.toInt()] != null
                    ? SideTitleWidget(
                  axisSide: meta.axisSide,
                    child: Text(
                      chartData.bottomTitle[value.toInt()].toString(),
                      style: TextStyle(
                          fontSize: 12, color: Colors.grey[400])),
                )
                    : const SizedBox();
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              getTitlesWidget: (double value, TitleMeta meta) {
                return chartData.leftTitle[value.toInt()] != null
                    ? Text(chartData.leftTitle[value.toInt()].toString(),
                    style: TextStyle(
                        fontSize: 12, color: Colors.grey[400]))
                    : const SizedBox();
              },
              showTitles: false,
              interval: 1,
              reservedSize: 40,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),

        lineBarsData: [
          LineChartBarData(
            color: chartColor,
            barWidth: 4,
            belowBarData: BarAreaData(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  chartColor.withOpacity(0.5),
                  Colors.transparent
                ],
              ),
              show: false,
            ),
            dotData: const FlDotData(show: false),
            isCurved: true,
            spots: chartData.spots,

          )
        ],
        minX: 0,
        maxX: 21,
        maxY: 40,
        minY: 18,
      ),
    );
  }
}
