import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;

  CustomTextField({required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Text(
            "Pain Level",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),

          // Container mimicking TextField with chips inside
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!, width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Wrap(
              spacing: 12.0,
              runSpacing: 12.0,
              children: [
                _buildPainChip("No Pain", Colors.blue, Colors.white),
                _buildPainChip("Mild", Colors.transparent, Colors.black),
                _buildPainChip("Moderate", Colors.transparent, Colors.black),
                _buildPainChip("Severe", Colors.transparent, Colors.black),
                _buildPainChip("Very Severe", Colors.transparent, Colors.black),
                _buildPainChip("Worst Severe", Colors.transparent, Colors.black),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build each chip with text and emoji icon
  Widget _buildPainChip(String label, Color backgroundColor, Color textColor) {
    return Chip(
      avatar: Icon(
        Icons.emoji_emotions, // Emoji icon
        color: textColor,
        size: 18,
      ),
      label: Text(
        label,
        style: TextStyle(color: textColor),
      ),
      backgroundColor: backgroundColor,
      shape: StadiumBorder(side: BorderSide(color: Colors.grey[300]!, width: 1)),
    );
  }
}