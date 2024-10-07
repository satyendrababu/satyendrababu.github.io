import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_ehr/helper/router_helper.dart';
import 'package:simple_ehr/utils/images.dart';
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

  int currentImageIndex = 0;
  List<String> images = [
    Images.splash_1,
    Images.splash_2,
    Images.splash_3,
    Images.splash_4,
    Images.splash_5,
    Images.splash_6,
    Images.splash_7,
  ];

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

    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent, // Make the nav bar transparent too
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        currentImageIndex = (currentImageIndex + 1) % images.length;
      });
    });
    if(currentImageIndex == 6) {
      _navigateToHome();
    }

  }


  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 1), () {

    });
    RouterHelper.getLoginRoute(action: RouteAction.pushNamedAndRemoveUntil);
  }
  @override
  void dispose() {
    super.dispose();
    _onConnectivityChanged.cancel();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Image.asset(
              images[currentImageIndex],
              fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}


