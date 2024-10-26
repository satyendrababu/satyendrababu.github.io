import 'package:flutter/material.dart';
import 'package:simple_ehr/utils/app_context_extension.dart';
import '../../../utils/constant.dart';
import '../../../utils/images.dart';
import '../../../utils/styles.dart';
import '../../../widget/svg_suffix_icon.dart';
import '../../../widget/default_button.dart';

class CreateNewPasswordForm extends StatefulWidget {
  const CreateNewPasswordForm({super.key});

  @override
  State<CreateNewPasswordForm> createState() => _CreateNewPasswordFormState();
}

class _CreateNewPasswordFormState extends State<CreateNewPasswordForm> {

  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;
  bool remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [

          buildPasswordFormField(),
          const SizedBox(height: 24),
          buildConformPassFormField(),
          const SizedBox(height: 32),
          DefaultButton(
            text: "Reset Password",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                //Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }

            },
          ),

        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    OutlineInputBorder buildOutlineInputBorder(Color borderColor, {double borderWidth = 1.0}) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: borderColor, width: borderWidth),
      );
    }
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: mPassNullError);
        } else if (value.length >= 8) {
          removeError(error: mShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: mPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: mShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: textHintStyle,
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        border: buildOutlineInputBorder(Colors.transparent), // Default border (no border)
        focusedBorder: buildOutlineInputBorder(Colors.blue), // Border when focused
        enabledBorder: buildOutlineInputBorder(context.resources.color.colorTextFieldBorder), // Border when enabled
        errorBorder: buildOutlineInputBorder(Colors.red), // Border when error
        focusedErrorBorder: buildOutlineInputBorder(Colors.red), // Border when focused with error
        filled: true,
        fillColor: context.resources.color.colorTextFieldFill, // Background color of the TextFormField
        prefixIcon: const SvgSuffixIcon(svgIcon: Images.lock),
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    OutlineInputBorder buildOutlineInputBorder(Color borderColor, {double borderWidth = 1.0}) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: borderColor, width: borderWidth),
      );
    }
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: mPassNullError);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: mMatchPassError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: mPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: mMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Confirm Password",
        hintStyle: textHintStyle,
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        border: buildOutlineInputBorder(Colors.transparent), // Default border (no border)
        focusedBorder: buildOutlineInputBorder(Colors.blue), // Border when focused
        enabledBorder: buildOutlineInputBorder(context.resources.color.colorTextFieldBorder), // Border when enabled
        errorBorder: buildOutlineInputBorder(Colors.red), // Border when error
        focusedErrorBorder: buildOutlineInputBorder(Colors.red), // Border when focused with error
        filled: true,
        fillColor: context.resources.color.colorTextFieldFill, // Background color of the TextFormField
        prefixIcon: const SvgSuffixIcon(svgIcon: Images.lock),
      ),
    );
  }
}