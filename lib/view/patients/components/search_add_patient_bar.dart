import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:simple_ehr/utils/app_context_extension.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/view/sign_in/component/sign_in_body.dart';
import 'package:simple_ehr/view/sign_in/component/sign_in_form.dart';

import '../../../utils/icons_m.dart';
import '../../../utils/images.dart';
import '../../../utils/styles.dart';
import '../../../widget/svg_icon.dart';
import '../../../widget/svg_suffix_icon.dart';
import '../../base/custom_box_shadow.dart';

class SearchAddPatientBar extends StatefulWidget {
  const SearchAddPatientBar({super.key});

  @override
  State<SearchAddPatientBar> createState() => _SearchAddPatientBarState();
}

class _SearchAddPatientBarState extends State<SearchAddPatientBar> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
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
                  padding: const EdgeInsets.only(bottom: 20.0),
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
                  child: buildSearchMRNFormField(),
                ),


                // New Patient Button
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
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
          enabledBorder: buildOutlineInputBorder(Color(0XFF95DDFF)), // Border when enabled
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
  Container buildSearchMRNFormField() {
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
          hintText: "Search MRN...",
          hintStyle: textHintStyle,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          border: buildOutlineInputBorder(Colors.transparent), // Default border (no border)
          focusedBorder: buildOutlineInputBorder(Colors.blue), // Border when focused
          enabledBorder: buildOutlineInputBorder(Color(0XFF95DDFF)), // Border when enabled
          errorBorder: buildOutlineInputBorder(Colors.red), // Border when error
          focusedErrorBorder: buildOutlineInputBorder(Colors.red), // Border when focused with error
          filled: true,
          fillColor: mainBackgroundColor, // Background color of the TextFormField
          prefixIcon: const SvgSuffixIcon(svgIcon: IconsM.searchGrey),


        ),
      ),
    );
  }
}