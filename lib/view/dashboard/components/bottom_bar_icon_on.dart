import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomBarIconOn extends StatelessWidget {

  BottomBarIconOn({super.key, required this.svgIcon});

  final String svgIcon;
  //final double size;



  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
        svgIcon,
        height: 40,
    );
  }

}