import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import '../../../utils/icons_m.dart';
import '../../../utils/styles.dart';
import '../../../widget/submit_button.dart';
import '../../../widget/svg_icon.dart';

class AddHistoryDialog extends StatefulWidget {


  @override
  State<AddHistoryDialog> createState() => _AddHistoryDialogState();
}

class _AddHistoryDialogState extends State<AddHistoryDialog> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final TextEditingController firstNameController = TextEditingController();
    return Dialog(
      backgroundColor: Colors.white,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
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
                  crossAxisCount: 1,
                  shrinkWrap: true,
                  crossAxisSpacing: 16,
                  //mainAxisSpacing: 16,
                  childAspectRatio: 3,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    buildTextField("Date of Admission",
                        "09-12-2016", firstNameController, 'Please enter date of admission'),
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
      maxLines: 12,
      cursorColor: blueColor,
      controller: controller,
      style: interMedium.copyWith(color: textColor, fontSize: 14),
      decoration: InputDecoration(

          labelText: labelText,
         floatingLabelAlignment: FloatingLabelAlignment.start,
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