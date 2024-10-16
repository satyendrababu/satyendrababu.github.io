import 'package:flutter/material.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/utils/styles.dart';
import 'package:simple_ehr/view/patients/components/my_sliver_page.dart';
import 'package:simple_ehr/view/patients/components/patient_image_widget.dart';
import 'package:simple_ehr/view/patients/components/radio_group_field.dart';
import 'package:simple_ehr/widget/custom_dropdown_menu.dart';
import 'package:simple_ehr/widget/custom_radio_button.dart';
import 'package:simple_ehr/widget/submit_button.dart';

import '../../widget/custom_text_field.dart';

class NewPatientEnrollment extends StatefulWidget {
  static final String id = "new_patient_enrollment";

  const NewPatientEnrollment({super.key});

  @override
  State<NewPatientEnrollment> createState() => _NewPatientEnrollmentState();
}

class _NewPatientEnrollmentState extends State<NewPatientEnrollment> {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              //_scrollView(_scrollController, context),
              const SizedBox(height: 40),
              buildEnrollmentForm(),
              const SizedBox(height: 32),
      
            ],
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

  // Reusable TextField Widget with Validation
  Widget buildTextField(String labelText, TextEditingController controller,
      String errorMessage, {FormFieldValidator<String>? validator}) {
    return TextFormField(
      cursorColor: blueColor,
      controller: controller,
      style: interMedium.copyWith(color: textColor, fontSize: 16),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: blueColor,
          fontSize: 16,
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
        fillColor: Colors.grey[100],
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: 'Type your first name',
        hintStyle: TextStyle(
          fontSize: 16,
          color: const Color(0XFFC5C5C5),
          fontWeight: interMedium.fontWeight
        )
      ),
      validator: validator ?? (value) {
        if (value == null || value.isEmpty) {
          return errorMessage;
        }
        return null;
      },
    );
  }

  Scrollbar _scrollView(ScrollController scrollController, BuildContext context) {
    return Scrollbar(
        controller: scrollController,
        child: Container(

          color: mainBackgroundColor,
          child: CustomScrollView(
            controller: scrollController,

            slivers: [
              SliverAppBar(
                floating: true,
                elevation: 0,
                centerTitle: false,
                automaticallyImplyLeading: false,
                backgroundColor: mainBackgroundColor,
                pinned: false,
                leading: null,
                title: Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'New Patient Enrollment',
                          textAlign: TextAlign.left,

                          style: TextStyle(
                              fontWeight: interSemiBold.fontWeight,
                              color: textColor,
                              fontSize: 28
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),


              SliverPersistentHeader(
                pinned: true,
                delegate: SliverDelegate(
                  child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               /* PatientImageWidget(),
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
                SubmitButton(text: 'Submit', press: (){})*/
                MySliverPage()

              ],
            ),
                ),
              ),

              /* SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: Column(

                  children: [
                    buildTextField(
                      'Patient First Name',
                      firstNameController,
                      'Please enter first name',
                    ),
                    buildTextField(
                      'Patient Last Name',
                      lastNameController,
                      'Please enter last name',
                    ),
                    buildTextField(
                      'Date of Birth',
                      dateOfBirthController,
                      'Please enter date of birth',
                    ),
                    buildTextField(
                      'Email Address',
                      emailController,
                      'Please enter a valid email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    buildTextField(
                      'Contact Number',
                      contactNumberController,
                      'Please enter contact number',
                    ),
                    buildGenderSelection(),
                  ],
                ),
              ),*/
            ],
          ),
        )
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;

  SliverDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 110;

  @override
  double get minExtent => 110;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 110 || oldDelegate.minExtent != 110 || child != oldDelegate.child;
  }
}