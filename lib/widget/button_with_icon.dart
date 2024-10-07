import 'package:flutter/material.dart';
import 'package:simple_ehr/utils/app_context_extension.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/utils/styles.dart';
import 'package:simple_ehr/widget/svg_icon.dart';

class ButtonWithIcon extends StatelessWidget {
  final String icon;
  final String text;
  final Function? press;

  ButtonWithIcon({required this.icon, required this.text, required this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press as void Function()?,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(// Button color
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              context.resources.color.colorStart, // Start color
              context.resources.color.colorEnd, // End color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.4), // Shadow color
              spreadRadius: 2,
              blurRadius: 15,
              offset: Offset(0, 8), // Position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgIcon(
              svgIcon: icon,
            ),
            SizedBox(width: 8),
            Text(
              text,
              style: interMedium.copyWith(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
