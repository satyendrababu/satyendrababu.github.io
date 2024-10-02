import 'package:flutter/material.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/utils/icons_m.dart';
import 'package:simple_ehr/utils/styles.dart';
import 'package:simple_ehr/widget/submit_button.dart';
import 'package:simple_ehr/widget/svg_icon.dart';

class AddAdmissionInfoDialog extends StatefulWidget {

  @override
  State<AddAdmissionInfoDialog> createState() => _AddAdmissionInfoDialogState();
}

class _AddAdmissionInfoDialogState extends State<AddAdmissionInfoDialog> {


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
                      'New Admission Information',
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
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  crossAxisSpacing: 16,
                  //mainAxisSpacing: 16,
                  childAspectRatio: 3,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    buildTextField("Date of Admission",
                        "09-12-2016", firstNameController, 'Please enter date of admission'),
                    buildTextField("Date of Discharge", "09-18-2016", firstNameController, 'Please enter date of admission'),
                    buildTextField("Length of Stay", "6 Days", firstNameController, 'Please enter date of admission'),
                    buildTextField("Service", "Surgery", firstNameController, 'Please enter date of admission'),
                    buildTextField("Attending Physician", "Dr. P", firstNameController, 'Please enter date of admission'),
                    buildTextField("Admitting Physician", "Dr. H", firstNameController, 'Please enter date of admission'),
                    buildTextField("Floor", "3", firstNameController, 'Please enter date of admission'),
                    buildTextField("Room", "23", firstNameController, 'Please enter date of admission'),
                    buildTextField("Bed", "A", firstNameController, 'Please enter date of admission'),
                    buildTextField("Surgery/Procedure", "Lap Cholecystectomy", firstNameController, 'Please enter date of admission'),
                    buildTextField("Date of Procedure", "09-13-2016", firstNameController, 'Please enter date of admission'),
                    buildTextField("Post Operative Days", "41 Days", firstNameController, 'Please enter date of admission'),
                    buildTextField("Surgery/Procedure", "Exploratory Laparoscopic", firstNameController, 'Please enter date of admission'),
                    buildTextField("Date of Procedure", "09-13-2016", firstNameController, 'Please enter date of admission'),
                    buildTextField("Post Operative Days", "41 Days", firstNameController, 'Please enter date of admission'),
                  ],
                ),
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



  Widget buildTextField(String labelText, String initialValue,TextEditingController controller,
      String errorMessage, {FormFieldValidator<String>? validator}) {
    return TextFormField(
      //initialValue: initialValue,
      cursorColor: blueColor,
      controller: controller,
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
          hintText: 'Type your first name',
          hintStyle: TextStyle(
            //fontSize: 16,
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
}





/*// Function to build TextFormField with given label and initial value
  Widget buildTextField1(String label, String initialValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          initialValue: initialValue,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }*/