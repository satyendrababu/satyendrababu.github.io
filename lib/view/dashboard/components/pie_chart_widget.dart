import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_ehr/data/local/pie_data.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/utils/images.dart';
import 'package:simple_ehr/utils/styles.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});



  @override
  Widget build(BuildContext context) {
    final pieChartData = PieData();
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 240,
            child: Stack(
              children: [
                PieChart(
                    PieChartData(
                      sectionsSpace: 0,
                      centerSpaceRadius: 70,
                      startDegreeOffset: -90,
                      //sections: pieChartData.pieChartSelectionData,
                        sections: _getSections(),
                      borderData: FlBorderData(show: false)
                    )
                ),
                Positioned(
                  top: 20,
                  left: 10,
                  child: SvgPicture.asset(
                    Images.lineBlue,
                    width: 50, // Adjust width as needed
                    height: 50, // Adjust height as needed
                  ),
                ),
                // Position lineBlue for the second direction (top-right)
                Positioned(
                  top: 20,
                  right: 10,
                  child: SvgPicture.asset(
                    Images.lineBlue,
                    width: 50, // Adjust width as needed
                    height: 50, // Adjust height as needed
                  ),
                ),
                // Position lineBlue for the third direction (bottom-center)
                Positioned(
                  bottom: 20,
                  left: 80, // Adjust left for horizontal centering
                  child: SvgPicture.asset(
                    Images.lineBlue,
                    width: 50, // Adjust width as needed
                    height: 50, // Adjust height as needed
                  ),
                ),
                // Centered content in the middle of the PieChart
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Images.lineBlue), // Add your middle content
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                          'Completed Task',
                        style: TextStyle(
                          color: textColor,
                          fontWeight: interRegular.fontWeight,
                          fontSize: 12
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                      '942',
                    style: TextStyle(
                        color: textColor,
                        fontWeight: interSemiBold.fontWeight,
                        fontSize: 32
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: lightRedColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Pending Task',
                        style: TextStyle(
                            color: textColor,
                            fontWeight: interRegular.fontWeight,
                            fontSize: 12
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    '42',
                    style: TextStyle(
                        color: textColor,
                        fontWeight: interSemiBold.fontWeight,
                        fontSize: 32
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: lightYellowColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Running Task',
                        style: TextStyle(
                            color: textColor,
                            fontWeight: interRegular.fontWeight,
                            fontSize: 12
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    '1,942',
                    style: TextStyle(
                        color: textColor,
                        fontWeight: interSemiBold.fontWeight,
                        fontSize: 32
                    ),
                  )
                ],
              ),

            ],
          )
        ],
      ),
    );
  }
  List<PieChartSectionData> _getSections() {
    return [
      PieChartSectionData(
        color: blueColor, // Color for completed tasks
        value: 55, // Percentage for completed tasks
        radius: 25, // Adjust size of each section
        titleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.transparent,
        ),
        //badgeWidget: _getBadgeWidget('Completed'),
        badgePositionPercentageOffset: 1.8,
        showTitle: false,

      ),
      PieChartSectionData(
        color: lightRedColor, // Color for pending tasks
        value: 25, // Percentage for pending tasks

        radius: 25,
        titleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.transparent,
        ),
        //badgeWidget: _getBadgeWidget('Pending'),
        badgePositionPercentageOffset: 1.3,
      ),
      PieChartSectionData(
        color: lightYellowColor, // Color for running tasks
        value: 30, // Percentage for running tasks
        radius: 25,
        titleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.transparent,
        ),
        //badgeWidget: _getBadgeWidget('Running'),
        badgePositionPercentageOffset: 1.3,
      ),
    ];
  }
  Widget _getBadgeWidget(String text) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

}