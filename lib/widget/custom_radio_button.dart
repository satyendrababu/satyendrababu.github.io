import 'package:flutter/material.dart';
import 'package:simple_ehr/utils/app_context_extension.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/utils/styles.dart';

class CustomRadioButton extends StatefulWidget {

  final Function(String) onSelectionChanged; // Callback function
  CustomRadioButton({required this.onSelectionChanged});


  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  int selectedIndex = 0; // 0 for Male, 1 for Female, 2 for Other
  final List<String> options = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color(0xFFC7D8FF), // Border color
              width: 1,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildRadioButton(context, 'Male', 0),
                const SizedBox(width: 16.0),
                _buildRadioButton(context, 'Female', 1),
                const SizedBox(width: 16.0),
                _buildRadioButton(context, 'Other', 2),
              ],
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: -10,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            child: Text(
              'Sex',
              style: interMedium.copyWith(color: blueColor, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRadioButton(BuildContext context, String text, int index) {
    bool isSelected = selectedIndex == index;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedIndex = index;
          widget.onSelectionChanged(options[selectedIndex]);
        });
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : defaultColor,
        backgroundColor: isSelected ? blueColor : Colors.white,
        side: BorderSide(color: isSelected? blueColor : defaultColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        minimumSize: Size(70, 30),
      ),
      child: Text(
        text,
        style: interRegular.copyWith(
          color: isSelected ? Colors.white : defaultColor,
        ),
      ),
    );
  }
}
