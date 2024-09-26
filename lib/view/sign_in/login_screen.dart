import 'package:flutter/material.dart';
import 'package:simple_ehr/utils/app_context_extension.dart';
import 'component/sign_in_body.dart';
class LoginScreen extends StatelessWidget {
  static String id = "login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.resources.color.colorWhite,
      /*appBar: AppBar(
        title: Text("Sign In"),
      ),*/
      body: const SignInBody(),
    );
  }

}