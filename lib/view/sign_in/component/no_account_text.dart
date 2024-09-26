import 'package:flutter/cupertino.dart';

import '../../../utils/styles.dart';


class NoAccountText extends StatelessWidget {
  const NoAccountText({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don’t have an account?",
          style: interRegular,
        ),
        GestureDetector(
          onTap: () {
            //Navigator.pushNamed(context, SignUpScreen.id);
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Sign Up",
              style: interMediumBlue,
            ),
          ),
        ),
      ],
    );
  }
}
