import 'package:flutter/material.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/utils/styles.dart';
import 'package:simple_ehr/view/patients/information/admission_information.dart';
import 'package:simple_ehr/view/patients/information/emergency_contact.dart';
import 'package:simple_ehr/view/patients/information/general_information.dart';
import 'package:simple_ehr/view/patients/new_patient_enrollment.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> with TickerProviderStateMixin {


  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
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
                              'General Information',
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
                            'Admission Information',
                            style: interMedium.copyWith(color: tabController.index == 1 ? textBlueColor : textBlackColor, fontSize: 16),
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
                            'Emergency Contact',
                            style: interMedium.copyWith(color: tabController.index == 2 ? textBlueColor : textBlackColor, fontSize: 16),
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
                            'Primary Care & Referring Physician',
                            style: interMedium.copyWith(color: tabController.index == 3 ? textBlueColor : textBlackColor, fontSize: 16),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    )
                ),

              ]
          ),
          Expanded(
              child: TabBarView(
                controller: tabController,
                  children: [
                    GeneralInformation(),
                    AdmissionInformation(),
                    EmergencyContact(),
                    Container(
                      child: Text('history'),
                    )
                  ]
              )
          )
        ],
      ),
    );
  }
}