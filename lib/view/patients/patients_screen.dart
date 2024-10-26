import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_ehr/utils/app_context_extension.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/view/base/custom_box_shadow.dart';
import 'package:simple_ehr/view/patients/components/search_add_patient_bar.dart';
import 'package:simple_ehr/widget/svg_icon.dart';

import '../../helper/responsive_helper.dart';
import '../../utils/icons_m.dart';
import '../../utils/styles.dart';
import '../../widget/svg_suffix_icon.dart';
import '../base/tab_app_bar.dart';
import 'components/patient.dart';
import 'components/patient_card.dart';

class PatientsScreen extends StatefulWidget {
  static final String id = "patient_screen";
  PatientsScreen({super.key});

  @override
  State<PatientsScreen> createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  final List<Patient> patients = [
    Patient(name: 'Smith John', age: 68, mrn: '1122334455', location: '47 W 13th St, New York'),
    Patient(name: 'Carroll Lubowitz', age: 65, mrn: '1122334455', location: '47 W 13th St, New York'),
    Patient(name: 'Katrina Fadel', age: 70, mrn: '1122334455', location: '47 W 13th St, New York'),
    Patient(name: 'Smith John', age: 68, mrn: '1122334455', location: '47 W 13th St, New York'),
    Patient(name: 'Carroll Lubowitz', age: 65, mrn: '1122334455', location: '47 W 13th St, New York'),
    Patient(name: 'Katrina Fadel', age: 70, mrn: '1122334455', location: '47 W 13th St, New York'),
    Patient(name: 'Smith John', age: 68, mrn: '1122334455', location: '47 W 13th St, New York'),
    Patient(name: 'Carroll Lubowitz', age: 65, mrn: '1122334455', location: '47 W 13th St, New York'),
    Patient(name: 'Katrina Fadel', age: 70, mrn: '1122334455', location: '47 W 13th St, New York'),
    Patient(name: 'Smith John', age: 68, mrn: '1122334455', location: '47 W 13th St, New York'),
    Patient(name: 'Carroll Lubowitz', age: 65, mrn: '1122334455', location: '47 W 13th St, New York'),
    Patient(name: 'Katrina Fadel', age: 70, mrn: '1122334455', location: '47 W 13th St, New York'),
    Patient(name: 'Smith John', age: 68, mrn: '1122334455', location: '47 W 13th St, New York'),
    Patient(name: 'Carroll Lubowitz', age: 65, mrn: '1122334455', location: '47 W 13th St, New York'),
    Patient(name: 'Katrina Fadel', age: 70, mrn: '1122334455', location: '47 W 13th St, New York'),
    Patient(name: 'Smith John', age: 68, mrn: '1122334455', location: '47 W 13th St, New York'),
    Patient(name: 'Carroll Lubowitz', age: 65, mrn: '1122334455', location: '47 W 13th St, New York'),
    Patient(name: 'Katrina Fadel', age: 70, mrn: '1122334455', location: '47 W 13th St, New York'),
    // Add more patients as needed
  ];

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);
    
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      //appBar: PreferredSize(preferredSize: Size.fromHeight(100), child: TabAppBar()),
      body: SafeArea(
        child: RefreshIndicator(
          color: context.resources.color.colorButton,
          backgroundColor: Colors.white,
          onRefresh: () async {

          },
          child: Stack(
            children: [
              _scrollView(_scrollController, context),
            ],
          ),
        ),
      ),

    );
  }

  Scrollbar _scrollView(ScrollController scrollController, BuildContext context) {
    return Scrollbar(
        controller: scrollController,
        child: Container(

          color: mainBackgroundColor,
          child: CustomScrollView(
            controller: scrollController,

            slivers: [
              SliverAppBar(
                floating: true,
                elevation: 0,
                centerTitle: false,
                automaticallyImplyLeading: false,
                backgroundColor: mainBackgroundColor,
                pinned: false,
                leading: null,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Patients',
                        textAlign: TextAlign.left,

                        style: TextStyle(
                            fontWeight: interSemiBold.fontWeight,
                            color: textColor,
                            fontSize: 28
                        ),
                      ),
                    ),

                  ],
                ),
              ),


              SliverPersistentHeader(
                pinned: true,
                delegate: SliverDelegate(
                  child: SearchAddPatientBar(),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: ResponsiveHelper.isDesktop(context)
                        ? 3 : ResponsiveHelper.isTablet(context) ? 2 : 1, // 3 items per row
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: 3, // Adjust as needed
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return PatientCard(patient: patients[index]);
                    },
                    childCount: patients.length,
                  ),
                ),
              ),

            ],
          ),
        )
    );
  }

}




class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;

  SliverDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 110;

  @override
  double get minExtent => 110;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 110 || oldDelegate.minExtent != 110 || child != oldDelegate.child;
  }
}