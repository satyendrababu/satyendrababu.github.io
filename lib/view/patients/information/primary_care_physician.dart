import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import '../../../utils/styles.dart';
import '../../../widget/button_with_icon.dart';
import '../../../widget/custom_text_field.dart';

class PrimaryCarePhysician extends StatefulWidget {
  const PrimaryCarePhysician({super.key});

  @override
  State<PrimaryCarePhysician> createState() => _PrimaryCarePhysicianState();
}

class _PrimaryCarePhysicianState extends State<PrimaryCarePhysician> {
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


              const SizedBox(height: 16),
              buildEnrollmentForm(),
              const SizedBox(height: 20),
              ButtonWithIcon(icon: '', text: 'Update', press: () {}),
              const SizedBox(height: 16),

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
            Flexible(child: CustomTextField(label: 'Doctor First Name')),
            SizedBox(width: 16),
            Flexible(child: CustomTextField(label: 'Doctor Last Name')),
            SizedBox(width: 16),
            Flexible(child: CustomTextField(label: 'Date of Birth')),
          ],
        ),
        SizedBox(height: 32),

        SizedBox(height: 32),
        Row(
          children: [

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
            Flexible(child: CustomTextField(label: 'Taking medications', maxLines: 6,)),
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