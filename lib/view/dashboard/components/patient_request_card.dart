import 'package:flutter/material.dart';
import 'package:simple_ehr/utils/styles.dart';

import '../../../utils/constant.dart';
import '../../base/custom_box_shadow.dart';

class PatientRequestCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Expanded(
          flex: 1,
          child: Container(
            width: 240,
            padding: const EdgeInsets.fromLTRB(20,20,20,10),
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
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: defaultColor,
                      child: Icon(Icons.person, color: Colors.grey[700],),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jons Sena",
                          style: TextStyle(
                            fontWeight: interMedium.fontWeight,
                            fontSize: 18,
                            color: textColor
                          ),
                        ),
                        Text(
                          "2 days ago",
                          style: TextStyle(
                              fontWeight: interRegular.fontWeight,
                              color: lightGreyColor
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Architecto consequatur molestias repellat qui. Quia est asd doloreque veniam est rerum. Soluta.",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: interRegular.fontWeight,
                      color: textColor
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Archive",
                        style: TextStyle(
                            color: redColor,
                            fontWeight: interMedium.fontWeight
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Accept",
                        style: TextStyle(
                            color: greenColor,
                          fontWeight: interMedium.fontWeight
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }

}