import 'package:flutter/material.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/utils/styles.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String? hintText;
  final String? initialValue;
  final String? errorText;
  final bool isPassword;
  final int? maxLines;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  CustomTextField({
    Key? key,
    required this.label,
    this.hintText,
    this.initialValue,
    this.errorText,
    this.isPassword = false,
    this.controller,
    this.onChanged,
    this.maxLines = 1
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isPassword;
  }

  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController effectiveController =
        widget.controller ?? TextEditingController(text: widget.initialValue);

    return Stack(
      clipBehavior: Clip.none,
      // Allows the label to extend beyond the stack's boundary
      children: [
        Container(
          //height: maxLines! + 60, // Adjust height based on maxLines
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0XFFC7D8FF), // Border color
              width: 1,
            ),
          ),
          padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
          child: TextFormField(
            maxLines: widget.maxLines,
            controller: effectiveController,
            cursorColor: blueColor,
            obscureText: widget.isPassword,
            decoration: InputDecoration(
                hintText: widget.isPassword ? '* * * * * *' : widget.hintText,
                hintStyle: interMedium.copyWith(
                    color: defaultColor, fontSize: 16),
                border: InputBorder.none,
                suffixIcon: widget.isPassword
                    ? IconButton(
                        onPressed: _toggleVisibility,
                        icon: Icon(
                          _isObscured ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        )
                      )
                    : null
            ),
            style: interMedium.copyWith(color: textColor, fontSize: 16),

          ),
        ),
        Positioned(
          left: 10,
          top: -14, // Move the label slightly above the border line
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16)
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
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