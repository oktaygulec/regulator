import 'package:flutter/material.dart';
import '../theme/color/color_schemes.dart';
import '../theme/extension/style_extension.dart';

class BottomSheetContainer extends Container {
  final String title;
  final Color? backgroundColor;
  final Widget body;

  BottomSheetContainer({
    Key? key,
    required this.title,
    required this.body,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color foregroundColor;
    Color topHandlerColor;

    if (backgroundColor == null) {
      foregroundColor = ColorSchemes.instance.primary;
      topHandlerColor = ColorSchemes.instance.black;
    } else {
      foregroundColor = backgroundColor!.computeLuminance() > 0.5
          ? ColorSchemes.instance.primary
          : ColorSchemes.instance.white;

      topHandlerColor = backgroundColor!.computeLuminance() > 0.5
          ? ColorSchemes.instance.black
          : ColorSchemes.instance.white;
    }

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? ColorSchemes.instance.lightGray,
        borderRadius: BorderRadius.only(
          topLeft: context.normalRadius,
          topRight: context.normalRadius,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.largePaddingValue,
        vertical: context.normalPaddingValue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              height: 6,
              width: 42,
              decoration: BoxDecoration(
                color: topHandlerColor.withOpacity(.3),
                borderRadius: context.largeBorderRadius,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.textTheme.headline6!.withColor(foregroundColor),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.close,
                  color: foregroundColor,
                ),
              ),
            ],
          ),
          SizedBox(height: context.smallPaddingValue),
          body,
        ],
      ),
    );
  }
}
