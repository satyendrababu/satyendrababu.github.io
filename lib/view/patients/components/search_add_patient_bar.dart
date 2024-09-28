import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_ehr/utils/app_context_extension.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/view/sign_in/component/sign_in_body.dart';
import 'package:simple_ehr/view/sign_in/component/sign_in_form.dart';

import '../../../utils/icons_m.dart';
import '../../../utils/images.dart';
import '../../../utils/styles.dart';
import '../../../widget/svg_suffix_icon.dart';

class SearchAddPatientBar extends StatefulWidget {
  const SearchAddPatientBar({super.key});

  @override
  State<SearchAddPatientBar> createState() => _SearchAddPatientBarState();
}

class _SearchAddPatientBarState extends State<SearchAddPatientBar> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildSearchNameFormField()

            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildSearchNameFormField() {
    OutlineInputBorder buildOutlineInputBorder(Color borderColor, {double borderWidth = 1.0}) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: borderColor, width: borderWidth),
      );
    }
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      //onSaved: (newValue) => email = newValue,
      onChanged: (value) {

        return;
      },
      validator: (value) {
        if (value!.isEmpty) {}
        return null;
      },
      decoration: InputDecoration(
        hintText: "Search Name...",
        hintStyle: textHintStyle,
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        border: buildOutlineInputBorder(Colors.transparent), // Default border (no border)
        focusedBorder: buildOutlineInputBorder(Colors.blue), // Border when focused
        enabledBorder: buildOutlineInputBorder(context.resources.color.colorTextFieldBorder), // Border when enabled
        errorBorder: buildOutlineInputBorder(Colors.red), // Border when error
        focusedErrorBorder: buildOutlineInputBorder(Colors.red), // Border when focused with error
        filled: true,
        fillColor: context.resources.color.colorTextFieldFill, // Background color of the TextFormField
        prefixIcon: const SvgSuffixIcon(svgIcon: IconsM.searchGrey),

      ),
    );
  }
}