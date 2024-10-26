import 'package:flutter/material.dart';
import 'package:simple_ehr/view/dashboard/components/top_data_card.dart';

import '../../../helper/responsive_helper.dart';
import '../../../utils/constant.dart';

class ResponsiveTopDataCard extends StatelessWidget {
  const ResponsiveTopDataCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return !isMobile
        ? const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TopDataCard(
                  title: 'Positive Response',
                  value: '200',
                  percentage: '+2,5%',
                  trendColor: greenColor),
              TopDataCard(
                  title: 'Pending Reports',
                  value: '872',
                  percentage: '-4,4%',
                  trendColor: redColor),
              TopDataCard(
                  title: 'New Patients',
                  value: '475',
                  percentage: '+2,5%',
                  trendColor: blueColor),
              TopDataCard(
                  title: 'Positive Cases',
                  value: '200',
                  percentage: '+2,5%',
                  trendColor: orangeColor),
            ],
          )
        : GridView.count(
            crossAxisCount: 2,
            // 2 columns
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            // Avoid scrolling inside grid
            childAspectRatio: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            // Adjust aspect ratio to control item height
            children: const [
              TopDataCard(
                  title: 'Positive Response',
                  value: '200',
                  percentage: '+2.5%',
                  trendColor: Colors.green),
              TopDataCard(
                  title: 'Pending Reports',
                  value: '872',
                  percentage: '-4.4%',
                  trendColor: Colors.red),
              TopDataCard(
                  title: 'New Patients',
                  value: '475',
                  percentage: '+2.5%',
                  trendColor: Colors.blue),
              TopDataCard(
                  title: 'Positive Cases',
                  value: '200',
                  percentage: '+2.5%',
                  trendColor: Colors.orange),
            ],
          );
  }
}
