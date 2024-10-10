import 'package:flutter/material.dart';
import 'package:simple_ehr/utils/app_context_extension.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/utils/styles.dart';
import 'package:simple_ehr/widget/svg_suffix_icon.dart';

import '../utils/icons_m.dart';

class CustomDropdownMenu extends StatefulWidget {

  final Function(String) onSelectionChanged; // Callback function
  final String label; // Label for the dropdown
  final List<String> options; // Dropdown options

  CustomDropdownMenu({
    required this.onSelectionChanged,
    required this.label,
    required this.options,
  });


  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  String? selectedItem; // To store the selected item

  @override
  void initState() {
    super.initState();
    selectedItem = widget.options[0]; // Default selected item
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color(0xFFC7D8FF), // Border color
                width: 1,
              ),
            ),
            padding: const EdgeInsets.fromLTRB(16,8,4,8),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedItem,
                  icon: SvgSuffixIcon(svgIcon: IconsM.arrowDown),
                  elevation: 16,
                  style: interMedium.copyWith(color: textColor, fontSize: 16),
                  dropdownColor: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedItem = newValue!;
                    });
                  },
                  items: widget.options
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
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
              widget.label,
              style: interMedium.copyWith(color: blueColor, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}
