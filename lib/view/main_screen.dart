import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_ehr/helper/responsive_helper.dart';
import 'package:simple_ehr/helper/router_helper.dart';
import 'package:simple_ehr/view/base/side_menu_widget.dart';
import 'package:simple_ehr/view/base/web_app_bar.dart';
import 'package:simple_ehr/view/dashboard/components/custom_bottom_navigation_bar.dart';
import 'package:simple_ehr/view/dashboard/dashboard_screen.dart';
import 'package:simple_ehr/view/patients/patient_details_screen.dart';
import 'package:simple_ehr/view/sign_in/login_screen.dart';

import 'base/tab_app_bar.dart';
import 'dashboard/components/top_data_widget.dart';
import 'patients/new_patient_enrollment.dart';
import 'patients/patients_screen.dart';

class MainScreen extends StatefulWidget {



  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0; // Initial screen



  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);

    return Scaffold(
      /*drawer: !isDesktop
          ? SizedBox(width: 250, child: SideMenuWidget(onMenuItemSelected: onMenuItemSelected,))
          : null,*/
      appBar: isDesktop
          ? PreferredSize(preferredSize: const Size.fromHeight(100), child: WebAppBar())
          : PreferredSize(preferredSize: const Size.fromHeight(100), child: TabAppBar()),
      //appBar: PreferredSize(preferredSize: const Size.fromHeight(100), child: WebAppBar()),
      bottomNavigationBar: !isDesktop
                  ? CustomBottomNavigationBar(
        onPageIndexChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      )
                  : null,
         body: SafeArea(

          child: Row(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(isDesktop)
              Expanded(
                  flex: 2,
                  child: SizedBox(
                    child: SideMenuWidget(
                      onPageIndexChanged: (index) {
                        setState(() {
                          currentPageIndex = index;
                        });
                      },
                    ),
                  )
              ),
              Expanded(
                  flex: 9,
                  child: _getPage(currentPageIndex), // Dynamically show the selected screen
                  //child: widget.child
              ),

            ],
          )
      ),
    );
  }
  void _onPageIndexChanged(int index) {
    setState(() {
      currentPageIndex = index;
    });
    switch (index) {
      case 0:
        context.go('/dashboard');
        break;
      case 1:
        context.go('/patients');
        break;
      case 2:
        context.go('/todo');
        break;
      case 3:
        context.go('/my_notes');
        break;
      default:
        break;
    }
  }
  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return DashboardScreen();
      case 1:
        return PatientsScreen();
      case 2:
        return NewPatientEnrollment();
      case 3:
        return PatientDetailsScreen();
      default:
        return Container();
    }
  }
  String _getTitle() {
    switch (currentPageIndex) {
      case 0:
        return 'Dashboard';
      case 1:
        return 'Patients';
      case 2:
        return 'To Do';
      case 3:
        return 'My Note';
      default:
        return ''; // Default title
    }
  }
}