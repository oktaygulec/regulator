import 'package:flutter/material.dart';
import '../helpers/local_notification_service.dart';
import '../helpers/token.dart';
import '../views/home/home_screen.dart';
import '../views/login/login_screen.dart';

class SplashProvider with ChangeNotifier {
  Future<String> getData(BuildContext context) async {
    await LocalNotificationService.init();

    await Future.delayed(const Duration(seconds: 1));

    final result = await Token.readToken('loginToken');
    if (result != null) {
      // await Provider.of<LoginProvider>(context, listen: false).getMyDetail();

      return HomeScreen.routeName;
    }
    // return LoginScreen.routeName;
    return HomeScreen.routeName;
  }
}
