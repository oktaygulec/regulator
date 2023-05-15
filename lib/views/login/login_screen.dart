import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '/theme/color/color_schemes.dart';
import '/theme/extension/style_extension.dart';
import '/views/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.normalPaddingValue,
            vertical: context.extraLargePaddingValue,
          ),
          child: Column(
            children: [
              Text(
                "LOGO",
                style: context.textTheme.headline3!.copyWith(
                  color: ColorSchemes.instance.primary,
                ),
              ),
              SizedBox(height: context.extraLargePaddingValue),
              TextFormField(
                controller: emailController,
                style: context.textTheme.bodyText1!.withColor(
                  ColorSchemes.instance.black,
                ),
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.email,
                  border: OutlineInputBorder(
                    borderRadius: context.normalBorderRadius,
                    borderSide: BorderSide(
                      color: ColorSchemes.instance.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: context.normalBorderRadius,
                    borderSide: BorderSide(
                      color: ColorSchemes.instance.black.withOpacity(.1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: context.normalBorderRadius,
                    borderSide: BorderSide(
                      color: ColorSchemes.instance.black,
                      width: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: context.normalPaddingValue),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                style: context.textTheme.bodyText1!.withColor(
                  ColorSchemes.instance.black,
                ),
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.password,
                  border: OutlineInputBorder(
                    borderRadius: context.normalBorderRadius,
                    borderSide: BorderSide(
                      color: ColorSchemes.instance.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: context.normalBorderRadius,
                    borderSide: BorderSide(
                      color: ColorSchemes.instance.black.withOpacity(.1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: context.normalBorderRadius,
                    borderSide: BorderSide(
                      color: ColorSchemes.instance.black,
                      width: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: context.normalPaddingValue),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                },
                style: ElevatedButton.styleFrom(
                  primary: ColorSchemes.instance.black,
                  onPrimary: ColorSchemes.instance.white,
                  minimumSize: const Size(double.maxFinite, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: context.normalBorderRadius,
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.login,
                  style: context.textTheme.button!.withColor(
                    ColorSchemes.instance.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
