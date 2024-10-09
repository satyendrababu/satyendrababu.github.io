import 'package:flutter/material.dart';

class RadioGroupField extends StatefulWidget {
  @override
  _RadioGroupFieldState createState() => _RadioGroupFieldState();
}

class _RadioGroupFieldState extends State<RadioGroupField> {
  int _selectedOption = 1; // Initial selected option

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0XFFC7D8FF)),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Positioned(
              top: -10,
              left: 15,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  'Label', // Label text here
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio<int>(
                      value: 1,
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                      },
                    ),
                    Text('Option 1'),
                  ],
                ),
                Row(
                  children: [
                    Radio<int>(
                      value: 2,
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                      },
                    ),
                    Text('Option 2'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
