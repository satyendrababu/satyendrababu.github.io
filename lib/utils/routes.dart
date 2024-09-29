
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:simple_ehr/view/patients/new_patient_enrollment.dart';
import 'package:simple_ehr/view/patients/patients_screen.dart';

import '../view/sign_in/login_screen.dart';

import '../view/splash/splash_screen.dart';


final Map<String, WidgetBuilder> routes = {

  LoginScreen.id : (context) => LoginScreen(),
  PatientsScreen.id : (context) => PatientsScreen(),
  NewPatientEnrollment.id : (context) => NewPatientEnrollment()

 };