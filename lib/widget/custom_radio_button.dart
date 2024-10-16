import 'package:flutter/material.dart';
import 'package:simple_ehr/utils/app_context_extension.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/utils/styles.dart';

class CustomRadioButton extends StatefulWidget {
  final String label;
  final List<String> options; // Options for radio buttons
  final Function(String) onSelectionChanged; // Callback function


  CustomRadioButton({
    required this.label,
    required this.options,
    required this.onSelectionChanged,
  });

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  int selectedIndex = 0;

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
              children: List.generate(widget.options.length, (index) {
                return Row(
                  children: [
                    _buildRadioButton(context, widget.options[index], index),
                    if (index < widget.options.length - 1)
                      const SizedBox(width: 16.0), // Space between buttons
                  ],
                );
              }),
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: -14,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            child: Text(
              widget.label,
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
          widget.onSelectionChanged(widget.options[selectedIndex]);
        });
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : defaultColor,
        backgroundColor: isSelected ? blueColor : Colors.white,
        side: BorderSide(color: isSelected ? blueColor : defaultColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        minimumSize: Size(0, 30),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0), // Adjust padding as needed
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

