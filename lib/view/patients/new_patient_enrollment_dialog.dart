import 'package:flutter/material.dart';

import '../../utils/constant.dart';
import '../../utils/icons_m.dart';
import '../../utils/styles.dart';
import '../../widget/custom_dropdown_menu.dart';
import '../../widget/custom_radio_button.dart';
import '../../widget/custom_text_field.dart';
import '../../widget/submit_button.dart';
import '../../widget/svg_icon.dart';
import 'components/patient_image_widget.dart';

class NewPatientEnrollmentDialog extends StatefulWidget {

  @override
  State<NewPatientEnrollmentDialog> createState() => _NewPatientEnrollmentDialogState();
}

class _NewPatientEnrollmentDialogState extends State<NewPatientEnrollmentDialog> {
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
                      'New Patient Enrollment',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PatientImageWidget(),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0XFFC7D8FF)),
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: RichText(
                          text: TextSpan(
                            text: 'MRN:',
                            style: TextStyle(
                                color: blueColor,
                                fontWeight: interRegular.fontWeight,
                                fontSize: 24
                            ),
                            children: [
                              TextSpan(
                                text: ' 1122334455',
                                style: TextStyle(
                                    color: nameBlackColor,
                                    fontWeight: interRegular.fontWeight,
                                    fontSize: 24
                                ),
                              ),
                            ],
                          ),

                        ),
                      ),
                    ),
                    SubmitButton(text: 'Submit', press: (){})

                  ],
                ),
                const SizedBox(height: 30),
                buildEnrollmentForm(),
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
  Widget buildEnrollmentForm(){
    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            Flexible(child: CustomTextField(label: 'Patient First Name')),
            SizedBox(width: 16),
            Flexible(child: CustomTextField(label: 'Patient Last Name')),
            SizedBox(width: 16),
            Flexible(child: CustomTextField(label: 'Date of Birth')),
          ],
        ),
        SizedBox(height: 32),
        Row(
          children: [
            Flexible(child:  CustomDropdownMenu(
              onSelectionChanged: (selectedStatus) {},
              label: 'Marital Status',
              options:['','Single', 'Married', 'Divorced', 'Widowed'],
            ),
            ),
            SizedBox(width: 16),
            Flexible(child: CustomTextField(label: 'Height (inches)')),
            SizedBox(width: 16),
            Flexible(child: CustomTextField(label: 'Weight (Pounds)')),
          ],
        ),
        SizedBox(height: 32),
        Row(
          children: [
            Flexible(child:  CustomDropdownMenu(
              onSelectionChanged: (selectedStatus) {},
              label: 'Marital Status',
              options:['','Single', 'Married', 'Divorced', 'Widowed'],
            ),
            ),
            SizedBox(width: 16),
            Flexible(child: CustomTextField(label: 'Contact Number')),
            SizedBox(width: 16),
            Flexible(child: CustomTextField(label: 'Email Address')),
          ],
        ),

        SizedBox(height: 32),
        Row(
          children: [

            Flexible(child: CustomTextField(label: 'Address Line1')),
            SizedBox(width: 16),
            Flexible(child: CustomTextField(label: 'Address Line2')),
          ],
        ),
        SizedBox(height: 32),
        Row(
          children: [
            Flexible(child: CustomTextField(label: 'State')),
            SizedBox(width: 16),
            Flexible(child: CustomTextField(label: 'Postal/Zip Code')),
            SizedBox(width: 16),
            Flexible(child: CustomTextField(label: 'City')),
          ],
        ),
        SizedBox(height: 32),
        Row(
          children: [
            Flexible(child: CustomTextField(label: 'Taking medications', maxLines: 12,)),
          ],
        ),

      ],
    );
  }
}