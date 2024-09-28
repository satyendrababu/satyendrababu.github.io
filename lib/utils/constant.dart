import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

const Color primaryColor = Color(0xFF4285F4);
const cardBackgroundColor = Color(0xFF21222D);
const secondaryColor = Color(0xFFFFFFFF);
const backgroundColor = Color(0xFF15131C);
const selectionColor = Color(0x0F4285F4);
const defaultColor = Color(0xFFB1B1B1);
const mainBackgroundColor = Color(0xFFF5F5F5);
const textHeadingColor = Color(0xFF141F39);
const textColor = Color(0xFF464255);
const textBlueColor = Color(0xFF2C67F2);
const patientCountColor = Color(0xFF00A389);
const lightGreyColor = Color(0xFFA3A3A3);


const greenColor = Color(0xFF00A389);
const redColor = Color(0xFFFF5B5B);
const blueColor = Color(0xFF2C67F2);
const orangeColor = Color(0xFFFEB052);
const lightYellowColor = Color(0xFFF1E6B9);
const lightRedColor = Color(0xFFEF9A91);
const barColor = Color(0x26AB54DB);

const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kPrimaryColor = Color(0xff272974);
const Color greyColor = Color(0xFFB8B5C3);
//const Color lightGreyColor = Color(0xFFF8F8F9);
const Color darkGreyColor = Color(0xFF1C1C25);

const Color purpleColor = Color(0xFF7B61FF);
const Color successColor = Color(0xFF2ED573);
const Color warningColor = Color(0xFFFFBE21);
const Color errorColor = Color(0xFFEA5B5B);

const defaultPadding = 20.0;
const double defaultBorderRadius = 12.0;

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'Password is required'),
  MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-])',
      errorText: 'passwords must have at least one special character')
]);

final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'Email is required'),
  EmailValidator(errorText: "Enter a valid email address"),
]);

final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String mEmailNullError = "Please Enter your email";
const String mInvalidEmailError = "Please Enter Valid Email";
const String mPassNullError = "Please Enter your password";
const String mShortPassError = "Password is too short";
const String mMatchPassError = "Passwords don't match";


