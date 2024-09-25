import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  final String svgIcon;

  SvgIcon({super.key, required this.svgIcon});

  @override
  Widget build(BuildContext context) {

    return SvgPicture.asset(
      svgIcon
    );
  }

}