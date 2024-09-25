import 'package:flutter/material.dart';
import 'package:simple_ehr/data/local/patient_top_data.dart';
import 'package:simple_ehr/view/dashboard/components/custome_card_widget.dart';

import '../../../utils/styles.dart';

class TopDataWidget extends StatelessWidget {
  const TopDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final patientTopData = PatientTopData();

    return GridView.builder(
        itemCount: patientTopData.topData.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, crossAxisSpacing: 15, mainAxisSpacing: 12),
        itemBuilder: (context, index) => CustomCardWidget(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    patientTopData.topData[index].text,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: interRegular.fontWeight,
                        color: const Color(0xFF464255),
                        fontSize: 14),
                  ),
                  Text(
                    patientTopData.topData[index].value,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: interSemiBold.fontWeight,
                        color: const Color(0xFF464255),
                        fontSize: 28),
                  ),
                  Text(
                    patientTopData.topData[index].valuePercent,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: interRegular.fontWeight,
                        color: patientTopData.topData[index].color,
                        fontSize: 18),
                  )
                ],
              ),
          color: Colors.white,
            ));
  }
}
