import 'package:flutter/material.dart';

class PageIndexProvider extends ChangeNotifier {
  int _currentIndex = 0;
  bool _isMenuTextVisible = true;

  int get currentIndex => _currentIndex;
  bool get isMenuTextVisible => _isMenuTextVisible;

  void setPageIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
  void setIsMenuTextVisible(bool isVisible) {
    _isMenuTextVisible = isVisible;
    notifyListeners();
  }
}