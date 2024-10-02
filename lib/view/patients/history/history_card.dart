import 'package:flutter/material.dart';
import 'package:simple_ehr/utils/icons_m.dart';
import 'package:simple_ehr/view/patients/history/add_history_dialog.dart';
import 'package:simple_ehr/widget/svg_icon.dart';

import '../../../utils/constant.dart';
import '../../../utils/styles.dart';
import '../../base/custom_box_shadow.dart';

class HistoryCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: CustomBoxShadow.getShadow(primaryColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(
                  "Allergies",
                  style: TextStyle(
                    fontWeight: interMedium.fontWeight,
                    fontSize: 18,
                    color: textColor,
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(context: context,
                        builder: (context) => AddHistoryDialog()
                    );
                  },
                  child: SvgIcon(svgIcon: IconsM.addRing),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Architecto consequatur molestias repellat qui. Quia est asd doloreque veniam est rerum. Soluta.",
              maxLines: 4,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: interRegular.fontWeight,
                color: textColor,
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Update",
                    style: TextStyle(
                      color: greenColor,
                      fontWeight: interMedium.fontWeight,
                    ),
                  ),
                ),
                Text(
                  "Last Update: 11/04/2023",
                  style: TextStyle(
                    color: defaultColor,
                    fontWeight: interMedium.fontWeight,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12,)
          ],
        ),
      ),
    );
  }
}
