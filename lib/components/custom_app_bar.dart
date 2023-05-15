import 'package:flutter/material.dart';
import '../theme/color/color_schemes.dart';
import '../theme/extension/style_extension.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final List<Widget> items;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final bool hasPop;

  const CustomAppBar({
    required this.items,
    this.padding,
    this.backgroundColor,
    this.hasPop = false,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size(double.maxFinite, kToolbarHeight * 1.25);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: preferredSize.height,
        padding: padding ?? context.normalPadding,
        color: backgroundColor ?? ColorSchemes.instance.lightGray,
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: hasPop == true
              ? [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(
                      Icons.chevron_left,
                    ),
                  ),
                  SizedBox(width: context.normalPaddingValue),
                  ...items
                ]
              : items,
        ),
      ),
    );
  }
}
