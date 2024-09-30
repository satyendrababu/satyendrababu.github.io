import 'package:flutter/material.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/utils/styles.dart';
import 'package:simple_ehr/view/patients/components/my_sliver_page.dart';
import 'package:simple_ehr/view/patients/components/patient_image_widget.dart';
import 'package:simple_ehr/widget/submit_button.dart';

class NewPatientEnrollment extends StatefulWidget {
  static final String id = "new_patient_enrollment";

  const NewPatientEnrollment({super.key});

  @override
  State<NewPatientEnrollment> createState() => _NewPatientEnrollmentState();
}

class _NewPatientEnrollmentState extends State<NewPatientEnrollment> {
  final _formKey = GlobalKey<FormState>();
  // TextEditingControllers to manage the input values
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  String gender = 'Male'; // Default value
  final ScrollController _scrollController = ScrollController();

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
              const SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 4,
                shrinkWrap: true,
      
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
              const SizedBox(height: 32),
      
            ],
          ),
        ),
      ),
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

  // Gender Selection Widget with Radio Buttons
  Widget buildGenderSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Sex'),
        Row(
          children: [
            Expanded(
              child: RadioListTile(
                title: const Text('Male'),
                value: 'Male',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value as String;
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile(
                title: const Text('Female'),
                value: 'Female',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value as String;
                  });
                },
              ),
            ),
          ],
        ),
      ],
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