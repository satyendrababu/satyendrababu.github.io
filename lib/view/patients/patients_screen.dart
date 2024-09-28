import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_ehr/utils/app_context_extension.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/view/base/custom_box_shadow.dart';
import 'package:simple_ehr/view/patients/components/search_add_patient_bar.dart';
import 'package:simple_ehr/widget/svg_icon.dart';

import '../../utils/icons_m.dart';
import '../../utils/styles.dart';
import '../../widget/svg_suffix_icon.dart';
import '../base/tab_app_bar.dart';

class PatientsScreen extends StatefulWidget {
  PatientsScreen({super.key});

  @override
  State<PatientsScreen> createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  final List<Patient> patients = [
    Patient(name: 'Smith John', age: 68, mrn: '1122334455', location: 'New York'),
    Patient(name: 'Carroll Lubowitz', age: 65, mrn: '1122334455', location: 'New York'),
    Patient(name: 'Katrina Fadel', age: 70, mrn: '1122334455', location: 'New York'),
    Patient(name: 'Smith John', age: 68, mrn: '1122334455', location: 'New York'),
    Patient(name: 'Carroll Lubowitz', age: 65, mrn: '1122334455', location: 'New York'),
    Patient(name: 'Katrina Fadel', age: 70, mrn: '1122334455', location: 'New York'),
    Patient(name: 'Smith John', age: 68, mrn: '1122334455', location: 'New York'),
    Patient(name: 'Carroll Lubowitz', age: 65, mrn: '1122334455', location: 'New York'),
    Patient(name: 'Katrina Fadel', age: 70, mrn: '1122334455', location: 'New York'),
    Patient(name: 'Smith John', age: 68, mrn: '1122334455', location: 'New York'),
    Patient(name: 'Carroll Lubowitz', age: 65, mrn: '1122334455', location: 'New York'),
    Patient(name: 'Katrina Fadel', age: 70, mrn: '1122334455', location: 'New York'),
    Patient(name: 'Smith John', age: 68, mrn: '1122334455', location: 'New York'),
    Patient(name: 'Carroll Lubowitz', age: 65, mrn: '1122334455', location: 'New York'),
    Patient(name: 'Katrina Fadel', age: 70, mrn: '1122334455', location: 'New York'),
    Patient(name: 'Smith John', age: 68, mrn: '1122334455', location: 'New York'),
    Patient(name: 'Carroll Lubowitz', age: 65, mrn: '1122334455', location: 'New York'),
    Patient(name: 'Katrina Fadel', age: 70, mrn: '1122334455', location: 'New York'),
    // Add more patients as needed
  ];

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      //appBar: PreferredSize(preferredSize: Size.fromHeight(100), child: TabAppBar()),
      body: _scrollView(_scrollController, context),/*SafeArea(
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
      ),*/
      /*body: Padding(
          padding: EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 items in each row
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 2, // Controls the height/width ratio of the items
          ),
          itemCount: patients.length,
          itemBuilder: (context, index) {
            return PatientCard(patient: patients[index]);
          },
        ),
      ),*/

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
                title: Flexible(
                  child: Column(
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
              ),


              SliverPersistentHeader(
                pinned: true,
                delegate: SliverDelegate(
                  child: Center(
                    child: Container(
                      color: mainBackgroundColor,
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                      child: Column(
                        children: [
                          const SizedBox(height: 16,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Search by Name Field
                              Expanded(
                                child: buildSearchNameFormField()
                              ),
                              SizedBox(width: 8),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 18.0),
                                child: Text(
                                  'Or',
                                  style: TextStyle(
                                    fontWeight: interRegular.fontWeight,
                                    color: greyColor
                                  ),
                                ),
                              ), // Space between two fields
                              SizedBox(width: 8),
                              // Search by MRN Field
                              Expanded(
                                child: buildSearchNameFormField(),
                              ),


                              // New Patient Button
                              Padding(
                                padding: const EdgeInsets.only(bottom: 18.0),
                                child: SizedBox(
                                  child: TextButton.icon(
                                    onPressed: () {
                                      // Add new patient action
                                    },
                                    icon: SvgIcon(svgIcon: IconsM.addRing),
                                    label: Text(
                                      "New Patient",
                                      style: TextStyle(
                                        fontWeight: interMedium.fontWeight,
                                        fontSize: 20,
                                        color: blueColor
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // 3 items per row
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 2, // Adjust as needed
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
  Container buildSearchNameFormField() {
    OutlineInputBorder buildOutlineInputBorder(Color borderColor, {double borderWidth = 1.0}) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(
            color: borderColor,
            width: borderWidth
        ),
      );
    }
    return Container(
      height: 76,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18), // Match border radius of the TextFormField
        boxShadow: CustomBoxShadow.getTextFieldShadow(primaryColor),
      ),
      child: TextFormField(
        keyboardType: TextInputType.text,
        //onSaved: (newValue) => email = newValue,
        onChanged: (value) {

          return;
        },
        validator: (value) {
          if (value!.isEmpty) {}
          return null;
        },
        decoration: InputDecoration(
          hintText: "Search Name...",
          hintStyle: textHintStyle,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          border: buildOutlineInputBorder(Colors.transparent), // Default border (no border)
          focusedBorder: buildOutlineInputBorder(Colors.blue), // Border when focused
          enabledBorder: buildOutlineInputBorder(context.resources.color.colorTextFieldBorder), // Border when enabled
          errorBorder: buildOutlineInputBorder(Colors.red), // Border when error
          focusedErrorBorder: buildOutlineInputBorder(Colors.red), // Border when focused with error
          filled: true,
          fillColor: mainBackgroundColor, // Background color of the TextFormField
          prefixIcon: const SvgSuffixIcon(svgIcon: IconsM.searchGrey),
          suffixIcon: const SvgSuffixIcon(svgIcon: IconsM.mic),

        ),
      ),
    );
  }
}
class Patient {
  final String name;
  final int age;
  final String mrn;
  final String location;

  Patient({required this.name, required this.age, required this.mrn, required this.location});
}

class PatientCard extends StatelessWidget {
  final Patient patient;

  const PatientCard({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Rounded corners
      ),
      elevation: 3, // Shadow effect
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Profile image placeholder
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.shade300,
              child: Icon(Icons.person, size: 40, color: Colors.grey.shade600),
            ),
            const SizedBox(width: 16.0),
            // Details section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Patient name
                  Text(
                    patient.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Age and MRN
                  RichText(
                    text: TextSpan(
                      text: 'Age: ${patient.age}  ',
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'MRN: ${patient.mrn}',
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Location
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        patient.location,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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