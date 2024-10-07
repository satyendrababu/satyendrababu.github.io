import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/utils/icons_m.dart';
import 'package:simple_ehr/utils/styles.dart';
import 'package:simple_ehr/widget/svg_icon.dart';

class PriorityTag extends StatelessWidget {
  final String priority;

  PriorityTag({required this.priority});

  Color get backgroundColor {
    switch (priority) {
      case "High":
        return redColorOpec;
      case "Low":
        return greenColorOpec;
      case "Important":
        return orangeColorOpec;
      default:
        return Colors.grey.shade200;
    }
  }

  Color get textColor {
    switch (priority) {
      case "High":
        return redColor;
      case "Low":
        return greenColor;
      case "Important":
        return orangeColor;
      default:
        return Colors.grey;
    }
  }

  String get icon {
    switch (priority) {
      case "High":
        return IconsM.highTag;
      case "Low":
        return IconsM.lowTag;
      case "Important":
        return IconsM.importantTag;
      default:
        return IconsM.highTag;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            height: 24,
            width: 24,

          ),
          const SizedBox(width: 4),
          Text(
            priority,
            style: interMedium.copyWith(color: textColor, fontSize: 16),
          ),
        ],
      ),
    );
  }
}