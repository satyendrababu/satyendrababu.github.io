import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_ehr/view/patients/results/select_lab_test_value_dialog.dart';

import '../../../data/local/side_menu_data.dart';
import '../../../utils/constant.dart';
import '../../../utils/icons_m.dart';
import '../../../utils/styles.dart';
import '../../../widget/submit_button.dart';
import '../../../widget/svg_icon.dart';
import '../../../widget/svg_suffix_icon.dart';
import '../../base/custom_box_shadow.dart';

class AddNewLabTestDialog extends StatefulWidget {

  @override
  State<AddNewLabTestDialog> createState() => _AddNewLabTestDialogState();
}

class _AddNewLabTestDialogState extends State<AddNewLabTestDialog> {
  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.white,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: screenSize.width * 0.6,  // 80% of screen width

            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New Vitals',
                      style: interSemiBold.copyWith(color: textBlackColor, fontSize: 16),
                    ),
                    IconButton(
                      icon: SvgIcon(svgIcon: IconsM.crossClose,),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                //Expanded(child: buildSearchNameFormField()),

                Padding(
                  padding: const EdgeInsets.fromLTRB(8,8, 16,0),
                  child: buildSearchNameFormField(),
                ),

                buildLabTestList(),
                const SizedBox(height: 20),
                /*Align(
                    alignment: Alignment.centerLeft,
                    child: SubmitButton(text: 'Update', press: (){})
                ),*/
              ],
            ),
          ),
        ),
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
          hintText: "Search Lab Tests...",
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

  SingleChildScrollView buildLabTestList() {
    final data = SideMenuData();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color(0XFFC5ECFF), // Outline color
              width: 1.0, // Outline width
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            /*child: ListView.builder(
              itemCount: data.sideMenuData.length,
              itemBuilder: (context, index) => buildMenuEntry(data, index),
            ),*/
            child: Column(
              children: List.generate(data.labTestData.length, (index) {
                return Column(
                  children: [
                    buildMenuEntry(data, index), // Your menu entry widget
                    // Add spacing between items if needed
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMenuEntry(SideMenuData data, int index) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        width: double.infinity,

        child: InkWell(
          onTap: () => setState(() {

          }),
          child: Column(
            children: [
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    data.labTestData[index].title,
                    style: interMedium.copyWith(color: lightGreyColor, fontSize: 14),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      showDialog(context: context,
                          builder: (context) => SelectLabTestValueDialog(data.labTestData[index].title)
                      );
                    },
                    child: SvgPicture.asset(
                      IconsM.addGrey,
                    ),
                  ),
                  SizedBox(width: 8,)
                ],
              ),
              SizedBox(height: 6),
              Container(
                height: 1,
                width: double.infinity,
                color: mainBackgroundColor,
              )
            ],
          ),

        ),
      ),
    );
  }
}