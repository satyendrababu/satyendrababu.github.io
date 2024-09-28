import 'package:flutter/material.dart';
import 'package:simple_ehr/helper/responsive_helper.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/utils/styles.dart';
import 'package:simple_ehr/view/dashboard/components/line_chart_widget.dart';

import '../../../data/local/line_data.dart';
import '../../base/custom_box_shadow.dart';

class TopDataCard extends StatelessWidget{
  final String title;
  final String value;
  final String percentage;
  final Color trendColor;

  TopDataCard({super.key, required this.title, required this.value, required this.percentage, required this.trendColor});



  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: CustomBoxShadow.getShadow(primaryColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: interRegular.fontWeight,
                      ),
                    ),
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 28,
                        color: textColor,
                        fontWeight: interSemiBold.fontWeight,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: ResponsiveHelper.isDesktop(context) ? 80 : 30,
                  height: ResponsiveHelper.isDesktop(context) ? 60 : 20,
                  child: LineChartWidget(chartColor: trendColor, chartData: LineData()),
                )
              ],
            ),*/
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontWeight: interRegular.fontWeight,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 28,
                        color: textColor,
                        fontWeight: interSemiBold.fontWeight,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      percentage,
                      style: TextStyle(
                        color: trendColor,
                        fontSize: 18,
                        fontWeight: interMedium.fontWeight,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: ResponsiveHelper.isDesktop(context) ? 100 : 50,
                  height: ResponsiveHelper.isDesktop(context) ? 80 : 40,
                  child: LineChartWidget(chartColor: trendColor, chartData: LineData()),
                )
              ],
            )

          ],
        ),
      ),
    );
  }

}