import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import '../../../utils/styles.dart';

class LabTestSubItem extends StatelessWidget {

  final String labTestName;

  LabTestSubItem(this.labTestName);

  @override
  Widget build(BuildContext context) {
    return getTestItem();
  }

  Widget getTestItem() {
    switch (labTestName) {
      case "Urine Pregnancy Test":
        return buildUrinePregnancy();
      case "Urine Dipstick":
        return buildUrineDipStick();
      case "TB PPD Skin Test":
        return buildTBPPDSkin();
      case "Vision Testing":
        return buildVision();
      case "Breathalyzer":
        return buildBreathalyzer();
      case "Rapid Strep":
        return buildRapidStrep();
      case "TB PPD Skin Test Result":
        return buildTBPPDSkinResult();
      default:
        return SizedBox();

    }
  }

  Widget buildUrinePregnancy() {
    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            buildTextField('Date of Test', '19-12-2024'),
            SizedBox(width: 16),
            buildTextField('Pregnancy Result', 'Negative'),
            SizedBox(width: 16),
            buildTextField('Urine Pregnancy Test Control', 'Visible'),
          ],
        ),
      ],
    );
  }
  Widget buildUrineDipStick() {
    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            buildTextField('Date of Test', '19-12-2024'),
            SizedBox(width: 16),
            buildTextField('Color', 'Colorless'),
            SizedBox(width: 16),
            buildTextField('Appearance', 'Slightly Cloudy'),
            SizedBox(width: 16),
            buildTextField('Specific Gravity', '1.000'),
          ],
        ),
        SizedBox(height: 24),
        Row(
          children: [
            buildTextField('pH', '5.5'),
            SizedBox(width: 16),
            buildTextField('Leukocytes', 'Negative'),
            SizedBox(width: 16),
            buildTextField('Nitrite', 'Positive'),
            SizedBox(width: 16),
            buildTextField('Protein', '4+(>2000 mg/dl)'),
            SizedBox(height: 8),
          ],
        ),
        SizedBox(height: 24),
        Row(
          children: [
            buildTextField('Glucose', '2000 or > mg/dl'),
            SizedBox(width: 16),
            buildTextField('Ketones', 'Trace'),
            SizedBox(width: 16),
            buildTextField('Urobilinogen', 'Normal'),
            SizedBox(width: 16),
            buildTextField('Bilirubin', 'Negative'),
            SizedBox(width: 16),
            buildTextField('Blood', '2+Moderate'),
          ],
        ),
      ],
    );
  }

  Widget buildTBPPDSkin() {
    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            buildTextField('Date of Test', '19-12-2024'),
            SizedBox(width: 16),
            buildTextField('Amount Administered', '233'),
            SizedBox(width: 16),
            buildTextField('Administration Site', 'Left Forearm'),
            SizedBox(width: 16),
            buildTextField('Manufacturer', 'Connaught Laboratories'),
          ],
        ),
        SizedBox(height: 24),
        Row(
          children: [
            buildTextField('Lot Number', '20/10'),
            SizedBox(width: 16),
            buildTextField('Expiration Date', 'xx/xx/xxx'),
            SizedBox(width: 16),
            buildTextField('Administration Reaction', '23/10'),
          ],
        ),

      ],
    );
  }

  Widget buildVision() {
    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            buildTextField('Date of Test', '19-12-2024'),
            SizedBox(width: 16),
            buildTextField('Corrective Lenses', 'None'),
            SizedBox(width: 16),
            buildTextField('Color Blind Correct Plates', '23'),
            SizedBox(width: 16),
            buildTextField('Left Eye', '20/10'),
          ],
        ),
        SizedBox(height: 24),
        Row(
          children: [
            buildTextField('Right Eye', '20/10'),
            SizedBox(width: 16),
            buildTextField('Left Eye with Corrective Lenses', '20/10'),
            SizedBox(width: 16),
            buildTextField('Right Eye with Corrective Lenses', '23/10'),
          ],
        ),

      ],
    );
  }

  Widget buildBreathalyzer() {
    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            buildTextField('Date of Test', '19-12-2024'),
            SizedBox(width: 16),
            buildTextField('Breathalyzer', '10%'),
          ],
        ),


      ],
    );
  }
  Widget buildRapidStrep() {
    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            buildTextField('Date of Test', '19-12-2024'),
            SizedBox(width: 16),
            buildTextField('Rapid Step Test Control', 'Visible'),
            SizedBox(width: 16),
            buildTextField('Rapid Step Results', 'Positive'),
          ],
        ),
      ],
    );
  }
  Widget buildTBPPDSkinResult() {
    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            buildTextField('Date of Test', '19-12-2024'),
            SizedBox(width: 16),
            buildTextField('PPD Result(mm of induration)', 'Visible'),
            SizedBox(width: 16),
            buildTextField('PPD Interpretation', 'Positive'),
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