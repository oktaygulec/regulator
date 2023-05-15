import 'package:flutter/material.dart';
import '../theme/color/color_schemes.dart';
import '../theme/extension/style_extension.dart';

class NoItemsContent extends StatelessWidget {
  final IconData iconData;
  final Color? iconColor;
  final String description;
  final String? title;
  final Widget? buttonContent;
  final Function()? onPressed;
  final EdgeInsets? padding;
  final Widget? extraContent;

  const NoItemsContent({
    Key? key,
    required this.iconData,
    required this.description,
    this.title,
    this.iconColor,
    this.padding,
    this.buttonContent,
    this.onPressed,
    this.extraContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding ??
            EdgeInsets.symmetric(horizontal: context.normalPaddingValue),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 128,
              color: iconColor ?? ColorSchemes.instance.primary,
            ),
            SizedBox(height: context.extraLargePaddingValue),
            if (title != null)
              Text(
                title!,
                style: context.textTheme.headline5!.copyWith(
                  letterSpacing: 1,
                  color: ColorSchemes.instance.primary,
                ),
                textAlign: TextAlign.center,
              ),
            if (title != null) SizedBox(height: context.normalPaddingValue),
            Text(
              description,
              style: context.textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            if (buttonContent != null)
              SizedBox(height: context.extraLargePaddingValue),
            if (buttonContent != null)
              Padding(
                padding: context.horizontalNormalPadding,
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.maxFinite, 48),
                  ),
                  child: buttonContent,
                ),
              ),
            if (extraContent != null) extraContent!,
          ],
        ),
      ),
    );
  }
}
