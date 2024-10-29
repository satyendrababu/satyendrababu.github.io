import 'package:flutter/material.dart';
import 'package:simple_ehr/view/profile/change_password_form.dart';

class ChangePasswordDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Dialog(
      backgroundColor: Colors.white,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
              width: screenSize.width * 0.4,
              child: const ChangePasswordForm()
          ),
        ),
      ),
    );

  }

}