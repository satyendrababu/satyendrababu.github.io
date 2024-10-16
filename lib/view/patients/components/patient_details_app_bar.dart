import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_ehr/utils/images.dart';

import '../../../utils/constant.dart';
import '../../../utils/icons_m.dart';
import '../../../utils/styles.dart';
import '../../base/custom_box_shadow.dart';

class PatientDetailsAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 24, 16, 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: CustomBoxShadow.getAppBarShadow(primaryColor),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Container(
                  width: 70,
                  height: 70,
                  clipBehavior: Clip.antiAlias,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(12) // Adjust the radius as needed
                  ),
                  child: Image.asset(
                    Images.placeHolder,
                    fit: BoxFit.cover,
                  )
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align to start
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'John Smith',
                    style: interBold.copyWith(color: nameBlackColor, fontSize: 24),
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Age:',
                          style: TextStyle(
                              color: textColor,
                              fontWeight: interSemiBold.fontWeight,
              
                          ),
                          children: [
                            TextSpan(
                              text: ' 66',
                              style: TextStyle(
                                  color: blueColor,
                                  fontWeight: interSemiBold.fontWeight,
                              ),
                            ),
                          ],
                        ),
              
                      ),
                      SizedBox(width: 16),
                      RichText(
                        text: TextSpan(
                          text: 'MRN:',
                          style: TextStyle(
                              color: textColor,
                              fontWeight: interSemiBold.fontWeight,
                              fontSize: 16
                          ),
                          children: [
                            TextSpan(
                              text: ' 1122334455',
                              style: TextStyle(
                                  color: blueColor,
                                  fontWeight: interSemiBold.fontWeight,
                                  fontSize: 16
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      Row(
                        children: [
                          SvgPicture.asset(
                            IconsM.location,
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '47 W 13th St, New York, NY 10011, USA',
                            style: TextStyle(
                                color: textColor,
                                fontWeight: interMedium.fontWeight,
                                fontSize: 14
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              
              
                ],
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(
                  IconsM.close,
                  height: 30,
                  width: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}