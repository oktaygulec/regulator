import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/splash_provider.dart';
import '/theme/color/color_schemes.dart';
import '/theme/extension/style_extension.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<SplashProvider>(context, listen: false).getData(context),
      builder: (ctx, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data != null) {
            Future.delayed(
              Duration.zero,
              () => Navigator.pushReplacementNamed(context, snapshot.data!),
            );
          }
        }
        return Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            padding: EdgeInsets.only(bottom: context.largePaddingValue),
            decoration: BoxDecoration(
              color: ColorSchemes.instance.primary,
            ),
            // child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Container(
            //       width: MediaQuery.of(context).size.width / 2,
            //       height: MediaQuery.of(context).size.height / 3,
            //       padding: context.normalPadding,
            //       child: Image.asset(
            //         'assets/images/logo.png',
            //       ),
            //     ),
            //     Text(
            //       "LOGO",
            //       style: context.textTheme.headline4!.copyWith(
            //         color: ColorSchemes.instance.white,
            //         fontWeight: FontWeight.w600,
            //         letterSpacing: 3,
            //       ),
            //     ),
            //   ],
            // ),
            child: Center(
              child: Text(
                "R",
                style: context.textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: ColorSchemes.instance.white,
                  fontSize: 192,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
