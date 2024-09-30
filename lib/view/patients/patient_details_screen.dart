import 'package:flutter/material.dart';
import 'package:simple_ehr/view/patients/components/patient_details_app_bar.dart';
import 'package:simple_ehr/view/patients/components/patient_details_side_menu_widget.dart';
import 'package:simple_ehr/view/patients/information/information_screen.dart';
import 'package:simple_ehr/view/patients/patients_screen.dart';

import '../../helper/responsive_helper.dart';
import '../base/side_menu_widget.dart';
import '../base/tab_app_bar.dart';
import '../base/web_app_bar.dart';
import '../dashboard/dashboard_screen.dart';
import 'new_patient_enrollment.dart';

class PatientDetailsScreen extends StatefulWidget {
  const PatientDetailsScreen({super.key});

  @override
  State<PatientDetailsScreen> createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);

    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(140), child: PatientDetailsAppBar()),


      body: SafeArea(

          child: Row(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Expanded(
                    flex: 2,
                    child: SizedBox(
                      child: PatientDetailsSideMenuWidget(
                        onPageIndexChanged: (index) {
                          setState(() {
                            currentPageIndex = index;
                          });
                        },
                      ),
                    )
                ),
              Expanded(
                flex: 10,
                child: _getPage(currentPageIndex), // Dynamically show the selected screen
                //child: widget.child
              ),

            ],
          )
      ),
    );
  }
  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return InformationScreen();
      case 1:
        return PatientsScreen();
      case 2:
        return NewPatientEnrollment();
      case 3:
        return Container();
      default:
        return Container();
    }
  }
}