import 'package:flutter/material.dart';

class SelectLabTestValueDialog extends StatefulWidget {

  @override
  State<SelectLabTestValueDialog> createState() => _SelectLabTestValueDialogState();
}

class _SelectLabTestValueDialogState extends State<SelectLabTestValueDialog> {
  /*String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: InputDecorator(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: 20.0, vertical: 15.0),
          labelText: 'Label',
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        ),

        child: DropdownButtonHideUnderline( child:DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),

          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['One', 'Two', 'Free', 'Four']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),  ),
      ),
    );
  }*/
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    List<String> options = ['09-12-2024', '10-12-2024', '11-12-2024'];
    String? selectedDate = '09-12-2024';
    return Dialog(
      backgroundColor: Colors.white,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
              child: buildDropdownSelection(
                  'Date of test',
                  selectedDate,
                  options,
                  (newValue) {
                    setState(() {
                      selectedDate = newValue;
                    });
                  }
              ),

          ),
        ),
      ),
    );
  }

  Widget buildDropdownSelection(String labelText, String value, List<String> options, ValueChanged<String?> onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFC7D8FF)), // Outline color
        borderRadius: BorderRadius.circular(8), // Rounded corners
        color: Colors.white, // Background color
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label Text
          Text(
            labelText,
            style: TextStyle(
              color: Color(0xFF007AFF), // Label color
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4), // Space between label and dropdown
          // Dropdown button
          DropdownButtonFormField<String>(
            value: value,
            isExpanded: true,
            icon: Icon(Icons.arrow_drop_down),
            decoration: InputDecoration.collapsed(hintText: ''),
            style: TextStyle(
              color: Colors.black87, // Selected item text color
              fontSize: 16,
            ),
            onChanged: onChanged,
            items: options.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}