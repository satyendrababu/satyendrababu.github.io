import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_ehr/helper/router_helper.dart';
import 'package:simple_ehr/utils/styles.dart';
import 'package:simple_ehr/view/sign_in/login_screen.dart';


class SplashScreen extends StatefulWidget {

  static final String id = "splash_screen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldMessengerState> _globalKey = GlobalKey();
  late StreamSubscription<ConnectivityResult> _onConnectivityChanged;


  @override
  void initState() {
    super.initState();
    bool firstTime = true;
    _onConnectivityChanged = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(!firstTime){
        bool isNotConnected = result != ConnectivityResult.wifi && result != ConnectivityResult.mobile;
        isNotConnected ? const SizedBox() : _globalKey.currentState?.hideCurrentSnackBar();
        _globalKey.currentState?.showSnackBar(SnackBar(
            backgroundColor: isNotConnected ? Colors.red : Colors.green,
            content: Text(
              isNotConnected ? /*getTranslated('no_internet_connection', _globalKey.currentContext!)!*/'No Internet Connection' : /*getTranslated('connected', _globalKey.currentContext!)!*/'Connected',
              textAlign: TextAlign.center,
              style: interRegular.copyWith(
                color: Colors.white
              ),
            ),
        ));
        if(!isNotConnected) {

        }
      }
      firstTime = false;
    });
    /*SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(

          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        )
    );*/
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent, // Make the nav bar transparent too
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    _navigateToHome();
  }


  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 1), () {

    });
    /*Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );*/
    RouterHelper.getMainRoute(action: RouteAction.pushNamedAndRemoveUntil);
  }
  @override
  void dispose() {
    super.dispose();

    _onConnectivityChanged.cancel();
  }
  void _route() async{

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: SvgPicture.asset(
              'Images.splash',
              fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}


