import 'package:flutter/material.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/utils/icons_m.dart';
import 'package:simple_ehr/utils/styles.dart';
import 'package:simple_ehr/widget/svg_icon.dart';
import 'package:simple_ehr/widget/svg_suffix_icon.dart';

import '../../../widget/submit_button.dart';

class SelectLabTestValueDialog extends StatefulWidget {

  final String labTestName;

  SelectLabTestValueDialog(this.labTestName);

  @override
  State<SelectLabTestValueDialog> createState() =>
      _SelectLabTestValueDialogState();
}

class _SelectLabTestValueDialogState extends State<SelectLabTestValueDialog> {

  final TextEditingController firstNameController = TextEditingController();

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
            width: screenSize.width * 0.8,  // 80% of screen width

            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.labTestName,
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
                const SizedBox(height: 8),

                getTestItem(),

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

  Widget getTestItem() {
    switch (widget.labTestName) {
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

    var dateList = ['19-12-2024','20-12-2024','21-12-2024'];
    var pregnancyResultList = ['Negative','Positive'];
    var testControlList = ['Visible','Invisible'];

    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            buildTextField('Date of Test', '19-12-2024',dateList),
            SizedBox(width: 16),
            buildTextField('Pregnancy Result', 'Negative',pregnancyResultList),
            SizedBox(width: 16),
            buildTextField('Urine Pregnancy Test Control', 'Visible',testControlList),
          ],
        ),
      ],
    );
  }
  Widget buildUrineDipStick() {
    var dateList = ['19-12-2024','20-12-2024','21-12-2024'];
    var colorList = ['Colorless','Straw','Pale Yellow','Yellow','Dark Yellow', 'Amber','Brown','Orange','Pink','Red'];
    var appearanceList = ['Clear','Slightly Cloudy','Cloudy','Milky','Bloody'];
    var specificList = ['1.000','1.005','1.010','1.015','1,020','1.025'];
    var pHList = ['5','5.5','6','6.5','7','7.5'];
    var LeukocytesList = ['Negative','Trace','Small','Moderate','Large'];
    var NitriteList = ['Negative','Positive'];
    List<String> proteinOptions = [
      'Negative',
      'Trace',
      '1+ (30 mg/dl)',
      '2+ (100 mg/dl)',
      '3+ (300 mg/dl)',
      '4+ (> 2000 mg/dl)'
    ];

    List<String> glucoseOptions = [
      'Negative',
      '2+ (100 mg/dl)',
      '1/4 (250 mg/dl)',
      '1/2 (500 mg/dl)',
      '1 (1000 mg/dl)',
      '2000 or > mg/dl'
    ];

    List<String> ketonesOptions = [
      'Neg',
      'Trace',
      '1+',
      '2+',
      '3+'
    ];

    List<String> urobilinogenOptions = [
      'Normal',
      '0.2 mg/dl',
      '1 mg/dl',
      '2 mg/dl',
      '4 mg/dl',
      '8 mg/dl',
      '12 mg/dl'
    ];

    List<String> bilirubinOptions = [
      'Negative',
      'Small',
      'Moderate',
      'Large'
    ];

    List<String> bloodOptions = [
      'Negative',
      'Trace',
      '1+ Small',
      '2+ Moderate',
      '3+ Large'
    ];
    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            buildTextField('Date of Test', '19-12-2024',dateList),
            SizedBox(width: 16),
            buildTextField('Color', 'Colorless', colorList),
            SizedBox(width: 16),
            buildTextField('Appearance', 'Slightly Cloudy', appearanceList),
            SizedBox(width: 16),
            buildTextField('Specific Gravity', '1.000', specificList),
          ],
        ),
        SizedBox(height: 24),
        Row(
          children: [
            buildTextField('pH', '5.5', pHList),
            SizedBox(width: 16),
            buildTextField('Leukocytes', 'Negative', LeukocytesList),
            SizedBox(width: 16),
            buildTextField('Nitrite', 'Positive', NitriteList),
            SizedBox(width: 16),
            buildTextField('Protein', 'Negative', proteinOptions),
            SizedBox(height: 8),
          ],
        ),
        SizedBox(height: 24),
        Row(
          children: [
            buildTextField('Glucose', 'Negative', glucoseOptions),
            SizedBox(width: 16),
            buildTextField('Ketones', 'Trace', ketonesOptions),
            SizedBox(width: 16),
            buildTextField('Urobilinogen', 'Normal', urobilinogenOptions),
            SizedBox(width: 16),
            buildTextField('Bilirubin', 'Negative', bilirubinOptions),
            SizedBox(width: 16),
            buildTextField('Blood', '2+ Moderate', bloodOptions),
          ],
        ),
      ],
    );
  }

  Widget buildTBPPDSkin() {
    var dateList = ['19-12-2024','20-12-2024','21-12-2024'];
    var amountList = ['233','234','235','236'];
    var administrationList = ['Left Forearm','Right Forearm'];

    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            buildTextField('Date of Test', '19-12-2024', dateList),
            SizedBox(width: 16),
            buildTextField('Amount Administered', '233', amountList),
            SizedBox(width: 16),
            buildTextField('Administration Site', 'Left Forearm', administrationList),
            SizedBox(width: 16),
            buildTextField('Manufacturer', 'Left Forearm',administrationList),
          ],
        ),
        SizedBox(height: 24),
        Row(
          children: [
            buildTextField('Lot Number', '19-12-2024',dateList),
            SizedBox(width: 16),
            buildTextField('Expiration Date', '19-12-2024',dateList),
            SizedBox(width: 16),
            buildTextField('Administration Reaction', '19-12-2024',dateList),
          ],
        ),

      ],
    );
  }

  Widget buildVision() {
    var dateList = ['19-12-2024','20-12-2024','21-12-2024'];
    List<String> correctiveLensesOptions = [
      'None',
      'Glasses',
      'Contact lenses',
      'Surgical correction'
    ];

    List<String> leftEyeOptions = [
      '20/10', '20/13', '20/15', '20/20', '20/25', '20/30',
      '20/40', '20/50', '20/70', '20/100', '20/200'
    ];

    List<String> rightEyeOptions = [
      '20/10', '20/13', '20/15', '20/20', '20/25', '20/30',
      '20/40', '20/50', '20/70', '20/100', '20/200'
    ];

    List<String> leftEyeWithCorrectiveLensesOptions = [
      '20/10', '20/13', '20/15', '20/20', '20/25', '20/30',
      '20/40', '20/50', '20/70', '20/100', '20/200'
    ];

    List<String> rightEyeWithCorrectiveLensesOptions = [
      '20/10', '20/13', '20/15', '20/20', '20/25', '20/30',
      '20/40', '20/50', '20/70', '20/100', '20/200'
    ];

    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            buildTextField('Date of Test', '19-12-2024', dateList),
            SizedBox(width: 16),
            buildTextField('Corrective Lenses', 'None', correctiveLensesOptions),
            SizedBox(width: 16),
            buildTextField('Color Blind Correct Plates', '19-12-2024', dateList),
            SizedBox(width: 16),
            buildTextField('Left Eye', '20/10', leftEyeOptions),
          ],
        ),
        SizedBox(height: 24),
        Row(
          children: [
            buildTextField('Right Eye', '20/10', rightEyeOptions),
            SizedBox(width: 16),
            buildTextField('Left Eye with Corrective Lenses', '20/10',leftEyeWithCorrectiveLensesOptions),
            SizedBox(width: 16),
            buildTextField('Right Eye with Corrective Lenses', '20/10', rightEyeWithCorrectiveLensesOptions),
          ],
        ),

      ],
    );
  }

  Widget buildBreathalyzer() {
    var dateList = ['19-12-2024','20-12-2024','21-12-2024'];
    var breathList = ['10%','110%','210%'];
    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            buildTextField('Date of Test', '19-12-2024',dateList),
            SizedBox(width: 16),
            buildTextField('Breathalyzer', '10%', breathList),
          ],
        ),


      ],
    );
  }
  Widget buildRapidStrep() {
    var dateList = ['19-12-2024','20-12-2024','21-12-2024'];
    var pregnancyResultList = ['Negative','Positive'];
    var testControlList = ['Visible','Invisible'];
    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            buildTextField('Date of Test', '19-12-2024',dateList),
            SizedBox(width: 16),
            buildTextField('Rapid Step Test Control', 'Visible',testControlList),
            SizedBox(width: 16),
            buildTextField('Rapid Step Results', 'Positive',pregnancyResultList),
          ],
        ),
      ],
    );
  }
  Widget buildTBPPDSkinResult() {
    final String value = 'The reaction to the Mantoux test should be read 48 to 72 hours after the injection. The induration should be measured in millimeters, even those classified as negative. If no induration is found, "0 mm" should be recorded. The diameter of the indurated area should be measured across the forearm (perpendicular to the long axis). Erythema should not be measured. (Core Curriculum on Tuberculosis, National Center for HIV, STD & TB Prevention). Classification of the Tuberculin Reaction A tuberculin reaction of >= 5 mm of induration is classified as positive in the following groups: HIV-positive persons Recent contacts of TB case Persons with fibrotic changes on chest radiograph consistent with old healed TB Patients with organ transplants and other immunosuppressed patients (receiving the equivalent of >= 15mg/day of prednisone for >= 1 month) A tuberculin reaction of >= 10mm of induration is classified as positive in persons who do not meet the preceding criteria but who have other risk factors for TB. These include: Recent arrivals (< 5 years) from high-prevalence countries Injection drug users Residents and employees of high-risk congregate settings: prisons and jails, nursing homes and other long-term facilities for the elderly, hospitals and other health-care facilities and residential facilities for AIDS patients Mycobacteriology laboratory personnel Persons with clinical conditions that place them at high risk (see Transmission and Pathogenesis) Children 4 years of age, or children and adolescents exposed to adults in high-risk categories A tuberculin reaction of >= 15mm of induration is classified as positive in persons with no known risk factors for TB. However, targeted skin testing programs should only be conducted among high-risk groups.';
    var dateList = ['19-12-2024','20-12-2024','21-12-2024'];
    var pregnancyResultList = ['Negative','Positive'];
    var testControlList = ['Visible','Invisible'];
    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            buildTextField('Date of Test', '19-12-2024',dateList),
            SizedBox(width: 16),
            buildTextField('PPD Result(mm of induration)', 'Visible',testControlList),
            SizedBox(width: 16),
            buildTextField('PPD Interpretation', 'Positive',pregnancyResultList),
          ],
        ),
        SizedBox(height: 16),
        buildTextField1(widget.labTestName, value,firstNameController)
      ],
    );
  }


  Widget buildTextField(String label, String initialValue, List<String> itemList) {
    String? dropdownValue = initialValue;
    return Expanded(
      child: InputDecorator(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20,8,4,8),
            labelText: label,
            labelStyle: interMedium.copyWith(color: blueColor, fontSize: 16),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0XFFC7D8FF)),
                borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: SvgSuffixIcon(svgIcon: IconsM.arrowDown),
              elevation: 16,
              style: interMedium.copyWith(color: textColor, fontSize: 16),
              dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(10),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: itemList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          )
      ),
    );
  }

  Widget buildTextField1(String labelText, String initialValue,TextEditingController controller) {
    return TextFormField(
      initialValue: initialValue,
      cursorColor: blueColor,
      //controller: controller,
      maxLines: 12,
      style: interRegular.copyWith(color: iconColor, fontSize: 14),
      decoration: InputDecoration(

          labelText: '',
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
          hintStyle: TextStyle(
            //fontSize: 16,
              color: const Color(0XFFC5C5C5),
              fontWeight: interMedium.fontWeight
          )
      ),
    );
  }

}
