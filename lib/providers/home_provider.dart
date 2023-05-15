import 'package:flutter/material.dart';
import 'package:regulator/views/home/pages/home_page.dart';
import 'package:regulator/views/home/pages/profile_page.dart';

class HomeProvider with ChangeNotifier {
  int _navIndex = 0;

  int get navIndex => _navIndex;

  set navIndex(int val) {
    _navIndex = val;
    notifyListeners();
  }

  final List<Widget> navPages = const [
    HomePage(),
    ProfilePage(),
  ];
}
