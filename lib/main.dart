import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '/helpers/navigation_service.dart';
import '/helpers/routes.dart';
import '/providers/home_provider.dart';
import '/providers/splash_provider.dart';
import '/theme/app_theme.dart';
import '/views/splash_screen.dart';
import 'helpers/local_notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationService.init(); //
  await LocalNotificationService.requestIOSPermissions(); //
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(
        title: 'Regulator',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.instance.theme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        navigatorKey: NavigationService.navigatorKey,
        routes: routes,
        home: const SplashScreen(),
      ),
    );
  }
}
