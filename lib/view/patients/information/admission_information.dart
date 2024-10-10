import 'package:flutter/material.dart';
import 'package:simple_ehr/view/patients/information/add_admission_info_dialog.dart';

import '../../../utils/constant.dart';
import '../../../utils/icons_m.dart';
import '../../../utils/styles.dart';
import '../../../widget/svg_icon.dart';
import '../../../widget/svg_suffix_icon.dart';
import '../../base/custom_box_shadow.dart';
import 'admission_information_subitem.dart';

class AdmissionInformation extends StatefulWidget {
  @override
  State<AdmissionInformation> createState() => _AdmissionInformationState();
}

class _AdmissionInformationState extends State<AdmissionInformation> {
  final _formKey = GlobalKey<FormState>();
  final List<String> admissionData = [
    '09-12-2016 Admission Information',
    '09-12-2015 Admission Information',
    '09-12-2014 Admission Information',
    '09-12-2013 Admission Information',
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
                        builder: (context) => AddAdmissionInfoDialog()
                    );

                  },
                  icon: SvgIcon(svgIcon: IconsM.addRing),
                  label: Text(
                    "New Information",
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
                                style: interMedium.copyWith(color: textColor, fontSize: 16),
                              ),
                              const Spacer(),
                              SvgIcon(svgIcon: IconsM.arrowDown),
                            ],
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: AdmissionInformationSubitem(),
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
