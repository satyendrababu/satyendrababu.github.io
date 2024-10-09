import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import '../../../utils/styles.dart';

class VitalsSubItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            buildTextField('Date of Vitals', '19-12-2024'),
            SizedBox(width: 16),
            buildTextField('Temp', '3'),
            SizedBox(width: 16),
            buildTextField('TMax', '23'),
            SizedBox(width: 16),
            buildTextField('Pulse', 'A'),
          ],
        ),
        SizedBox(height: 24),
        Row(
          children: [
            buildTextField('SBP', 'A'),
            SizedBox(width: 16),
            buildTextField('DPB', '3'),
            SizedBox(width: 16),
            buildTextField('MAP', '23'),
            SizedBox(width: 16),
            buildTextField('Weight', '57'),
            SizedBox(height: 8),
          ],
        ),
        SizedBox(height: 24),
        Row(
          children: [
            buildTextField('Height', '6'),
            SizedBox(width: 16),
            buildTextField('BMI', '3'),
            SizedBox(width: 16),
            buildTextField('RR', '23'),
            SizedBox(width: 16),
            buildTextField('Pulse OX', 'A'),
          ],
        ),
      ],
    );
  }

  Widget buildTextField(String labelText, String initialValue) {
    return Expanded(
      child: TextFormField(
        initialValue: initialValue,
        cursorColor: blueColor,
        enabled: false,
        style: interMedium.copyWith(color: textColor, fontSize: 14),
        decoration: InputDecoration(

            labelText: labelText,
            labelStyle: TextStyle(
                color: blueColor,
                //fontSize: 16,
                fontWeight: interMedium.fontWeight
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0XFFC7D8FF))
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0XFFC7D8FF)), // Color when not focused
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: primaryColor, width: 1.0), // Color when focused
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: redColor, width: 1.0), // Color when error occurs
            ),
            filled: true,
            fillColor: Colors.white,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            //hintText: 'Type your first name',
            hintStyle: TextStyle(
              //fontSize: 16,
                color: const Color(0XFFC5C5C5),
                fontWeight: interMedium.fontWeight
            )
        ),
      ),
    );
  }
}