
import 'package:flutter/material.dart';
import 'package:simple_ehr/helper/responsive_helper.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/utils/styles.dart';
import 'package:simple_ehr/view/base/custom_box_shadow.dart';
import 'package:simple_ehr/view/dashboard/components/bar_chart_widget.dart';
import 'package:simple_ehr/view/dashboard/components/pie_chart_widget.dart';
import 'package:simple_ehr/view/dashboard/components/responsive_pie_charts.dart';
import 'package:simple_ehr/view/dashboard/components/top_data_card.dart';

import '../../data/local/bar_data.dart';
import 'components/patient_request_card.dart';
import 'components/responsive_top_data_card.dart';

class DashboardScreen extends StatelessWidget {


  const DashboardScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return SingleChildScrollView(
      padding: ResponsiveHelper.isDesktop(context) ? const EdgeInsets.fromLTRB(0,16,16,16) : const EdgeInsets.fromLTRB(8,16,16,16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Dashboard',
              style: TextStyle(
                  fontSize: 32,
                  color: textHeadingColor,
                  fontWeight: interSemiBold.fontWeight
              ),
            ),
          ),
          const SizedBox(height: 20),

          const ResponsiveTopDataCard(),

          const SizedBox(height: 32),
          const ResponsivePieCharts(),
          /*Row(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                          children: [
                            Text(
                              'New Patients Added',
                              style: TextStyle(
                                fontWeight: interMedium.fontWeight,
                                fontSize: 24,
                                color: textColor
                              ),
                            ),
                            Text(
                              'View more',
                              style: TextStyle(
                                fontWeight: interSemiBold.fontWeight,
                                color: textBlueColor
                              ),
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
                                color: patientCountColor
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                    '+0.4%',
                                  style: TextStyle(
                                    fontWeight: interMedium.fontWeight,
                                    fontSize: 16,
                                    color: textColor
                                  ),
                                ),
                                const SizedBox(height: 8,),
                                Text(
                                  'Than last week',
                                  style: TextStyle(
                                      fontWeight: interRegular.fontWeight,
                                      fontSize: 12,
                                      color: textColor
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox()
                          ],
                        ),

                        const SizedBox(height: 16),
                        Container(
                          height: 235,

                            child: BarChartWidget(chartColor: barColor, chartData: BarData()),
                            //child: PatientBarChart.withSampleData()// Bar chart height
                          *//*child: BarChart(
                            // Replace with actual data
                            BarChartData(
                              // Chart styling and data here
                            ),
                          ),*//*
                        ),
                      ],
                    ),
                  )
              ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                          children: [
                            Text(
                              'To Do',
                              style: TextStyle(
                                  fontWeight: interMedium.fontWeight,
                                  fontSize: 24,
                                  color: textColor
                              ),
                            ),
                            Text(
                              'Download Report',
                              style: TextStyle(
                                  fontWeight: interSemiBold.fontWeight,
                                  color: textBlueColor
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        //const Text('+0.4% Than last week'),

                        Container(
                          height: 320,

                          child: const PieChartWidget(),
                          // Pie chart height
                          *//*child: PieChart(
                            // Replace with actual data
                            PieChartData(
                              // Pie chart styling and data here
                            ),
                          ),*//*
                        ),
                      ],
                    ),
                  )
              )
            ],
          )*/
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Patient Requests',
              style: TextStyle(
                  fontSize: 24,
                  color: textHeadingColor,
                  fontWeight: interSemiBold.fontWeight
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Eum fuga consequuntur ut et.',
              style: TextStyle(
                  color: lightGreyColor,
                  fontWeight: interRegular.fontWeight
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 260,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 40,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(right: 10),
                    child: PatientRequestCard(),
                  );
                }
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

}