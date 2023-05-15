import 'package:flutter/widgets.dart';
import '/views/home/home_screen.dart';
import '/views/login/login_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
};

