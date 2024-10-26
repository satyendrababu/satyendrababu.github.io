import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_ehr/utils/icons_m.dart';

import '../utils/images.dart';
import '../utils/styles.dart';

class BackIcon extends StatelessWidget {

  final String title;

  const BackIcon({this.title = '', super.key});




  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: Row(
            children: [
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
                  child: SvgPicture.asset(IconsM.backIcon),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 6),
              Text(
                title,
                style: interSemiBoldBlack,
              )
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }


}