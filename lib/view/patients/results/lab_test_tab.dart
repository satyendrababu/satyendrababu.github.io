import 'package:flutter/material.dart';
import 'package:simple_ehr/view/patients/results/add_new_lab_test_dialog.dart';
import 'package:simple_ehr/view/patients/results/lab_test_sub_item.dart';
import 'package:simple_ehr/view/patients/results/select_lab_test_value_dialog.dart';

import '../../../data/local/side_menu_data.dart';
import '../../../utils/constant.dart';
import '../../../utils/icons_m.dart';
import '../../../utils/styles.dart';
import '../../../widget/svg_icon.dart';
import '../../../widget/svg_suffix_icon.dart';
import '../../base/custom_box_shadow.dart';

class LabTestTab extends StatefulWidget {

  @override
  State<LabTestTab> createState() => _LabTestTabState();
}

class _LabTestTabState extends State<LabTestTab> {


  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();

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
                        builder: (context) => AddNewLabTestDialog()
                        //builder: (context) => SelectLabTestValueDialog()
                    );

                  },
                  icon: SvgIcon(svgIcon: IconsM.addRing),
                  label: Text(
                    "New Lab Test",
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

                itemCount: data.labTestData.length,
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
                                data.labTestData[index].title,
                                style: interSemiBold.copyWith(color: textColor, fontSize: 20),
                              ),
                              SizedBox(width: 24),
                              Text(
                                data.labTestData[index].icon,
                                style: interMedium.copyWith(color: iconColor, fontSize: 16),
                              ),
                              const Spacer(),
                              SvgIcon(svgIcon: IconsM.edit),
                              SizedBox(width: 4,),
                              SvgIcon(svgIcon: IconsM.arrowDown),
                            ],
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: LabTestSubItem(data.labTestData[index].title),
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