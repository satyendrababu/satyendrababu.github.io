import 'package:flutter/material.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final String? initialValue;
  final String? errorText;
  final int? maxLines;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  CustomTextField({
    Key? key,
    required this.label,
    this.hintText,
    this.initialValue,
    this.errorText,
    this.controller,
    this.onChanged,
    this.maxLines = 1
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final TextEditingController effectiveController =
        controller ?? TextEditingController(text: initialValue);

    return Stack(
      clipBehavior: Clip.none, // Allows the label to extend beyond the stack's boundary
      children: [
        Container(
          //height: maxLines! + 60, // Adjust height based on maxLines
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color(0XFFC7D8FF), // Border color
              width: 1,
            ),
          ),
          padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
          child: TextFormField(
            maxLines: maxLines,
            controller: effectiveController,
            cursorColor: blueColor,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: interMedium.copyWith(color: defaultColor, fontSize: 16),
              border: InputBorder.none,
            ),
            style: interMedium.copyWith(color: textColor, fontSize: 16),

          ),
        ),
        Positioned(
          left: 10,
          top: -14, // Move the label slightly above the border line
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16)
            ),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            child: Text(
              label,
              style: interMedium.copyWith(color: blueColor, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}