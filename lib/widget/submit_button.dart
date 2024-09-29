import 'package:flutter/material.dart';
import 'package:simple_ehr/utils/app_context_extension.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/view/base/custom_box_shadow.dart';

import '../utils/styles.dart';


class SubmitButton extends StatelessWidget {
  final String? text;
  final Function? press;

  const SubmitButton({required this.text, required this.press});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 50,

      child: ElevatedButton(
        onPressed: press as void Function()?,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.all(0), // Set padding to 0 to align gradient with button borders
          backgroundColor: Colors.transparent,
          // Make background transparent to see gradient
           // Remove shadow color
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                context.resources.color.colorStart, // Start color
                context.resources.color.colorEnd, // End color
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: CustomBoxShadow.getShadow(primaryColor)
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              text!,
              style: interMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
