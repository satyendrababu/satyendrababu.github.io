import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_ehr/helper/router_helper.dart';
import 'package:simple_ehr/utils/icons_m.dart';
import 'package:simple_ehr/utils/images.dart';
import 'package:simple_ehr/utils/styles.dart';
import 'package:simple_ehr/view/patients/components/patient.dart';
import 'package:simple_ehr/view/patients/new_patient_enrollment.dart';
import 'package:simple_ehr/widget/svg_icon.dart';

import '../../../utils/constant.dart';
import '../../base/custom_box_shadow.dart';

class PatientCard extends StatelessWidget {
  final Patient patient;

  const PatientCard({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: CustomBoxShadow.getShadow(primaryColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          
          child: InkWell(
            onTap: () {
              RouterHelper.getPatientDetailsRoute();
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile image placeholder
                Container(
                  width: 90,
                  height: 90,
                  clipBehavior: Clip.antiAlias,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(12) // Adjust the radius as needed
                  ),
                    child: Image.asset(
                      Images.placeHolder,
                      fit: BoxFit.cover,
                    )
                ),
            
                const SizedBox(width: 12.0),
                // Details section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Patient name
                      Text(
                        patient.name,
                        style: TextStyle(
                          fontSize: 16,
                          color: nameBlackColor,
                          fontWeight: interBold.fontWeight,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        color: mainBackgroundColor,
                        height: 1,
                        width: double.infinity,
                      ),
                      const SizedBox(height: 8.0),
                      // Age and MRN
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Age:',
                              style: TextStyle(
                                  color: textColor,
                                fontWeight: interSemiBold.fontWeight,
                                fontSize: 12
                              ),
                              children: [
                                TextSpan(
                                  text: ' ${patient.age}',
                                  style: TextStyle(
                                      color: blueColor,
                                      fontWeight: interSemiBold.fontWeight,
                                      fontSize: 12
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
                                  fontSize: 12
                              ),
                              children: [
                                TextSpan(
                                  text: ' ${patient.mrn}',
                                  style: TextStyle(
                                      color: blueColor,
                                      fontWeight: interSemiBold.fontWeight,
                                      fontSize: 12
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      // Location
                      Row(
                        children: [
                          SvgPicture.asset(
                            IconsM.location,
                            height: 14,
                            width: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            patient.location,
                            style: TextStyle(
                                color: textColor,
                              fontWeight: interRegular.fontWeight,
                              fontSize: 10
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  }

}