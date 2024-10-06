import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import '../../../utils/icons_m.dart';
import '../../../utils/styles.dart';
import '../../../widget/submit_button.dart';
import '../../../widget/svg_icon.dart';
import '../../../widget/svg_suffix_icon.dart';
import '../../base/custom_box_shadow.dart';

class AddNewLabTestDialog extends StatelessWidget {

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
                const SizedBox(height: 20),

                //Expanded(child: buildSearchNameFormField()),
                buildSearchNameFormField(),

                const SizedBox(height: 20),
                Align(
                    alignment: Alignment.centerLeft,
                    child: SubmitButton(text: 'Update', press: (){})
                ),
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

}