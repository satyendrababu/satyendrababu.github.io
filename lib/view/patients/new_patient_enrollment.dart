import 'package:flutter/material.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/utils/styles.dart';
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

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                /*ElevatedButton(
                  //onPressed: _submitForm, // Submit form on button press
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Submit'),
                ),*/
              ],
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
}