import 'package:flutter/material.dart';

import '../data/repository/splash_repo.dart';

class SplashProvider extends ChangeNotifier {

  final SplashRepo? splashRepo;
  SplashProvider({required this.splashRepo});

}