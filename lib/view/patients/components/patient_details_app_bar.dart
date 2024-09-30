import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constant.dart';
import '../../../utils/icons_m.dart';
import '../../../utils/styles.dart';
import '../../base/custom_box_shadow.dart';

class PatientDetailsAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 24, 16, 16),
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
                  child: Image.network(
                    'https://s3-alpha-sig.figma.com/img/0844/4de9/97418cb7b10885001f1d12fe7966e72c?Expires=1728864000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LbpgyThNDu4AW1jBeDXwFvqnLjp2t~bSzQEjoZrZ107fx602uwtkdKauRibQkLmGhZfdrV8t4loRDqBC5zigwkFR-MmaOH2uczH3bWgUs2PjqDd~TMpIRsZRgS~fs2nx5dX5~8oZuA2JBjnxX0XDBnKy2S7UUer~ONOK34ELYfWNwQRHyE0~~23dE-EwqPpMleFnkwda842qLSV-W~gXFw3tDNNizuUPy-BmuMeP-YDl8Fi-GL3QfdvAdWF14At1aHbzY-r3XTN9RkqX3H3msAQsFA8iokbOyAFxhX6RjdcNZo7mcy3u7wzTvbEf4eD2yP926DbsZJge8fPs7gZT5w__',
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
              onTap: () {},
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