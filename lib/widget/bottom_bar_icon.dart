import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constant.dart';

class BottomBarIcon extends StatelessWidget {

  final String svgIcon;
  final bool isSelected;

  const BottomBarIcon({super.key, required this.svgIcon, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
        svgIcon,
        colorFilter: ColorFilter.mode(isSelected ? primaryColor : defaultColor, BlendMode.srcIn));
  }


}