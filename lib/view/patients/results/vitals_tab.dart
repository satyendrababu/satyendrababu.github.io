import 'package:flutter/material.dart';
import 'package:simple_ehr/utils/images.dart';
import 'package:simple_ehr/view/patients/results/add_new_vitals_dialog.dart';
import 'package:simple_ehr/view/patients/results/vitals_sub_item.dart';

import '../../../utils/constant.dart';
import '../../../utils/icons_m.dart';
import '../../../utils/styles.dart';
import '../../../widget/svg_icon.dart';
import '../../../widget/svg_suffix_icon.dart';
import '../../base/custom_box_shadow.dart';
import '../information/add_admission_info_dialog.dart';

class VitalsTab extends StatefulWidget {


  @override
  State<VitalsTab> createState() => _VitalsTabState();
}

class _VitalsTabState extends State<VitalsTab> {

  final _formKey = GlobalKey<FormState>();
  final List<String> admissionData = [
    '09-12-2016  Admission Information',
    '09-12-2015  Admission Information',
    '09-12-2014  Admission Information',
    '09-12-2013  Admission Information',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      body: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Search by Name Field
              Expanded(child: buildSearchNameFormField()),
              const SizedBox(width: 8),
              // New Information Button
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: TextButton.icon(
                  onPressed: () {
                    // Add new information action
                    showDialog(context: context,
                        builder: (context) => AddNewVitalsDialog()
                    );

                  },
                  icon: SvgIcon(svgIcon: IconsM.addRing),
                  label: Text(
                    "New Vitals",
                    style: TextStyle(
                        fontWeight: interMedium.fontWeight,
                        fontSize: 20,
                        color: blueColor),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Expanded ListView inside the column
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ListView.builder(

                itemCount: admissionData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                      child: Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          showTrailingIcon: false,
                          backgroundColor: Colors.transparent, // Set this to the surrounding color if needed
                          collapsedBackgroundColor: Colors.transparent, // Removes the default background
                          title: Row(
                            children: [
                              Text(
                                admissionData[index],
                                style: interSemiBold.copyWith(color: textColor, fontSize: 16),
                              ),
                              SizedBox(width: 24),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4), // Add padding
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      startColor,   // Gradient start color
                                      endColor,  // Gradient end color
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(20), // Rounded shape for the chip
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(Images.emoji),
                                    SizedBox(width: 8), // Space between icon and text
                                    Text(
                                      'No Pain',
                                      style: interMedium.copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              SvgIcon(svgIcon: IconsM.arrowDown),
                            ],
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: VitalsSubItem()
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }


  Container buildSearchNameFormField() {
    OutlineInputBorder buildOutlineInputBorder(Color borderColor,
        {double borderWidth = 1.0}) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: borderColor, width: borderWidth),
      );
    }

    return Container(
      height: 76,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        // Match border radius of the TextFormField
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
          hintText: "Search Date...",
          hintStyle: textHintStyle,
          contentPadding:
          const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          border: buildOutlineInputBorder(Colors.transparent),
          // Default border (no border)
          focusedBorder: buildOutlineInputBorder(Colors.blue),
          // Border when focused
          enabledBorder: buildOutlineInputBorder(Color(0XFF95DDFF)),
          // Border when enabled
          errorBorder: buildOutlineInputBorder(Colors.red),
          // Border when error
          focusedErrorBorder: buildOutlineInputBorder(Colors.red),
          // Border when focused with error
          filled: true,
          fillColor: mainBackgroundColor,
          // Background color of the TextFormField
          prefixIcon: const SvgSuffixIcon(svgIcon: IconsM.searchGrey),
        ),
      ),
    );
  }



}