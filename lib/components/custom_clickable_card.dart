import 'package:flutter/material.dart';
import '../theme/color/color_schemes.dart';
import '../theme/extension/style_extension.dart';

class CustomClickableCard extends StatelessWidget {
  final Widget child;
  final Widget? icon;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? elevation;
  final VoidCallback onTap;

  const CustomClickableCard({
    Key? key,
    required this.child,
    required this.onTap,
    this.backgroundColor,
    this.icon,
    this.padding,
    this.margin,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: backgroundColor ?? ColorSchemes.instance.primary,
        margin: margin ?? EdgeInsets.zero,
        elevation: elevation,
        child: Padding(
          padding: padding ?? context.normalPadding,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: child,
              ),
              const Spacer(),
              icon ??
                  Icon(
                    Icons.chevron_right,
                    color: ColorSchemes.instance.white,
                    size: 24,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
