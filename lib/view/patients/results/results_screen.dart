import 'package:flutter/material.dart';
import 'package:simple_ehr/view/patients/results/lab_test_tab.dart';
import 'package:simple_ehr/view/patients/results/vitals_tab.dart';

import '../../../utils/constant.dart';
import '../../../utils/styles.dart';
import '../information/admission_information.dart';
import '../information/general_information.dart';
import '../new_patient_enrollment.dart';

class ResultsScreen extends StatefulWidget {

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {}); // Rebuild the widget when the tab index changes
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TabBar(
              controller: tabController,
              dividerColor: Colors.transparent,
              isScrollable: true,
              labelPadding: const EdgeInsets.symmetric(horizontal: 8),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 4.0, color: blueColor), // Customize the color and thickness of the line
                insets: EdgeInsets.symmetric(horizontal: 24.0), // Control the padding for the indicator line
              ),
              tabs: [
                Tab(
                    child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                          child: Text(
                            'Vitals',
                            style: interMedium.copyWith(color: tabController.index == 0 ? textBlueColor : textBlackColor, fontSize: 16),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    )
                ),
                Tab(
                    child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                          child: Text(
                            'Lab Tests',
                            style: interMedium.copyWith(color: tabController.index == 1 ? textBlueColor : textBlackColor, fontSize: 16),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    )
                ),


              ]
          ),
          SizedBox(height: 16,),
          Expanded(
              child: TabBarView(
                  controller: tabController,
                  children: [
                    VitalsTab(),
                    LabTestTab(),
                  ]
              )
          )
        ],
      ),
    );
  }
}