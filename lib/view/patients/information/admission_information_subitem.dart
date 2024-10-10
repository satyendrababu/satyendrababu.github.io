import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import '../../../utils/styles.dart';

class AdmissionInformationSubitem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            buildTextField('Date of Information', '19-12-2024'),
            SizedBox(width: 16),
            buildTextField('Date of Discharge', '19-12-2024'),
            SizedBox(width: 16),
            buildTextField('Length of Stay', '6 Days'),
            SizedBox(width: 16),
            buildTextField('Service', 'Surgery'),
          ],
        ),
        SizedBox(height: 24),
        Row(
          children: [
            buildTextField('Attending Physician', 'Dr. P'),
            SizedBox(width: 16),
            buildTextField('Admitting Physician', 'Dr. H'),
            /*SizedBox(width: 16),
            buildTextField('MAP', '23'),
            SizedBox(width: 16),
            buildTextField('Weight', '57'),
            SizedBox(height: 8),*/
          ],
        ),
        SizedBox(height: 24),
        Row(
          children: [
            buildTextField('Floor', '6'),
            SizedBox(width: 16),
            buildTextField('Room', '3'),
            SizedBox(width: 16),
            buildTextField('Bed', '23'),

          ],
        ),
        SizedBox(height: 24),
        Row(
          children: [
            buildTextField('Surgery/Procedure', '6'),
            SizedBox(width: 16),
            buildTextField('Date of Procedure', '3'),
            SizedBox(width: 16),
            buildTextField('Post Operative Days', '23'),
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