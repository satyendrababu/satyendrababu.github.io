import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/utils/icons_m.dart';
import 'package:simple_ehr/utils/styles.dart';
import 'package:simple_ehr/view/base/custom_box_shadow.dart';

class PatientImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Allows the camera icon to go outside the box
      children: [
        // Image placeholder
        DottedBorder(
          dashPattern: [8,8],
          strokeWidth: 1,
          color: Color(0XFFC7D8FF),
          borderType: BorderType.RRect,
          child: Container(
            width: 140, // Adjust the size as per your needs
            height: 140,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(IconsM.photoPlaceHolder, width: 45, height: 45),
                Text(
                  'Patient Image',
                  style: interMedium.copyWith(color: Color(0XFFC7D8FF), fontSize: 16),
                ),
              ],
            ),
          ),
        ),

        // Camera Icon
        Positioned(
          bottom: -12, // Controls the position of the camera icon
          right: -12,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: CustomBoxShadow.getShadow(primaryColor),
            ),
            child: IconButton(
              icon: SvgPicture.asset(IconsM.camera),
              onPressed: () {
                // Logic for uploading or capturing a new image
              },
            ),
          ),
        ),
      ],
    );
  }
}
