import 'package:flutter/material.dart';
import 'package:simple_ehr/view/patients/history/history_card.dart';

class HistoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
        physics: ScrollPhysics(),
        children: [
            HistoryCard(),
            HistoryCard(),
            HistoryCard(),
          HistoryCard(),
          HistoryCard(),
          HistoryCard(),
          HistoryCard(),
          HistoryCard(),
          HistoryCard(),
          HistoryCard(),
          HistoryCard(),
          HistoryCard(),

          ],
      ),
    );
  }


}