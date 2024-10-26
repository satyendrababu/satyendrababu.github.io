import 'package:flutter/material.dart';
import 'package:simple_ehr/view/dashboard/components/pie_chart_widget.dart';

import '../../../data/local/bar_data.dart';
import '../../../helper/responsive_helper.dart';
import '../../../utils/constant.dart';
import '../../../utils/styles.dart';
import '../../base/custom_box_shadow.dart';
import 'bar_chart_widget.dart';

class ResponsivePieCharts extends StatelessWidget {
  const ResponsivePieCharts({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return !isMobile
        ? Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: CustomBoxShadow.getShadow(primaryColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New Patients Added',
                        style: TextStyle(
                            fontWeight: interMedium.fontWeight,
                            fontSize: 24,
                            color: textColor),
                      ),
                      Text(
                        'View more',
                        style: TextStyle(
                            fontWeight: interSemiBold.fontWeight,
                            color: textBlueColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '980',
                        style: TextStyle(
                            fontWeight: interRegular.fontWeight,
                            fontSize: 49,
                            color: patientCountColor),
                      ),
                      Column(
                        children: [
                          Text(
                            '+0.4%',
                            style: TextStyle(
                                fontWeight: interMedium.fontWeight,
                                fontSize: 16,
                                color: textColor),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Than last week',
                            style: TextStyle(
                                fontWeight: interRegular.fontWeight,
                                fontSize: 12,
                                color: textColor),
                          ),
                        ],
                      ),
                      const SizedBox()
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 235,
                    child: BarChartWidget(
                        chartColor: barColor, chartData: BarData()),
                  ),
                ],
              ),
            )),
        const SizedBox(width: 16),
        Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: CustomBoxShadow.getShadow(primaryColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'To Do',
                        style: TextStyle(
                            fontWeight: interMedium.fontWeight,
                            fontSize: 24,
                            color: textColor),
                      ),
                      Text(
                        'Download Report',
                        style: TextStyle(
                            fontWeight: interSemiBold.fontWeight,
                            color: textBlueColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 320,
                    child: const PieChartWidget(),
                  ),
                ],
              ),
            ))
      ],
    )
        : SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: CustomBoxShadow.getShadow(primaryColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New Patients Added',
                      style: TextStyle(
                          fontWeight: interMedium.fontWeight,
                          fontSize: 24,
                          color: textColor),
                    ),
                    Text(
                      'View more',
                      style: TextStyle(
                          fontWeight: interSemiBold.fontWeight,
                          color: textBlueColor),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '980',
                      style: TextStyle(
                          fontWeight: interRegular.fontWeight,
                          fontSize: 49,
                          color: patientCountColor),
                    ),
                    Column(
                      children: [
                        Text(
                          '+0.4%',
                          style: TextStyle(
                              fontWeight: interMedium.fontWeight,
                              fontSize: 16,
                              color: textColor),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Than last week',
                          style: TextStyle(
                              fontWeight: interRegular.fontWeight,
                              fontSize: 12,
                              color: textColor),
                        ),
                      ],
                    ),
                    const SizedBox()
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  height: 235,
                  child: BarChartWidget(
                      chartColor: barColor, chartData: BarData()),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: CustomBoxShadow.getShadow(primaryColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'To Do',
                      style: TextStyle(
                          fontWeight: interMedium.fontWeight,
                          fontSize: 24,
                          color: textColor),
                    ),
                    Text(
                      'Download Report',
                      style: TextStyle(
                          fontWeight: interSemiBold.fontWeight,
                          color: textBlueColor),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  height: 320,
                  child: const PieChartWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
