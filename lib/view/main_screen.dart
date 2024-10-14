import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:simple_ehr/helper/responsive_helper.dart';
import 'package:simple_ehr/helper/router_helper.dart';
import 'package:simple_ehr/view/base/side_menu_widget.dart';
import 'package:simple_ehr/view/base/web_app_bar.dart';
import 'package:simple_ehr/view/dashboard/components/custom_bottom_navigation_bar.dart';
import 'package:simple_ehr/view/dashboard/dashboard_screen.dart';
import 'package:simple_ehr/view/page_index_provider.dart';
import 'package:simple_ehr/view/patients/information/add_admission_info_dialog.dart';
import 'package:simple_ehr/view/patients/patient_details_screen.dart';
import 'package:simple_ehr/view/sign_in/login_screen.dart';
import 'package:simple_ehr/view/to_do/to_do_screen.dart';

import '../provider/splash_provider.dart';
import 'base/tab_app_bar.dart';
import 'dashboard/components/top_data_widget.dart';
import 'patients/new_patient_enrollment.dart';
import 'patients/patients_screen.dart';

class MainScreen extends StatefulWidget {
  final int currentPageIndex;

  const MainScreen({super.key, required this.currentPageIndex});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentPageIndex = 0; // Initial screen
  PageController? _pageController;
  late List<Widget> _screens;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _currentPageIndex = widget.currentPageIndex;
    _pageController = PageController(initialPage: widget.currentPageIndex);

    _screens = [
      DashboardScreen(),
      PatientsScreen(),
      ToDoScreen(),
      NewPatientEnrollment()
    ];

    final splashProvider = Provider.of<SplashProvider>(context, listen: false);
    splashProvider.initConfig();
  }

  @override
  Widget build(BuildContext context) {

    final isDesktop = ResponsiveHelper.isDesktop(context);

    final pageIndexNotifier = Provider.of<PageIndexProvider>(context);

    return Scaffold(
      /*drawer: !isDesktop
          ? SizedBox(width: 250, child: SideMenuWidget(onMenuItemSelected: onMenuItemSelected,))
          : null,*/
      key: _scaffoldKey,
      appBar: isDesktop
          ? PreferredSize(preferredSize: const Size.fromHeight(100), child: WebAppBar())
          : PreferredSize(preferredSize: const Size.fromHeight(100), child: TabAppBar()),
      //appBar: PreferredSize(preferredSize: const Size.fromHeight(100), child: WebAppBar()),
      bottomNavigationBar: !isDesktop
          ? CustomBottomNavigationBar(

        onPageIndexChanged: (index) {

          pageIndexNotifier.setPageIndex(index);
          _setPage(pageIndexNotifier.currentIndex);
          /*setState(() {
            currentPageIndex = index;
          });*/
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
                          //currentPageIndex = index;
                          //_setPage(index);
                          pageIndexNotifier.setPageIndex(index);
                          _setPage(pageIndexNotifier.currentIndex);
                        });
                      },
                    ),
                  )
              ),
              Expanded(
                  flex: 9,
                  //child: _getPage(currentPageIndex), // Dynamically show the selected screen
                  child: PageView.builder(
                    controller: _pageController,
                      itemCount: _screens.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        /*_setPage(index);
                        _getPage(index);*/
                        return _screens[pageIndexNotifier.currentIndex];

                      }
                  ),
              ),

            ],
          )
      ),
    );
  }
  void _setPage(int pageIndex) {
    setState(() {

      _currentPageIndex = pageIndex;
      _pageController!.jumpToPage(pageIndex);
    });
  }

  void _onPageIndexChanged(int index) {
    setState(() {
      _currentPageIndex = index;
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
    switch (_currentPageIndex) {
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