import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension TextStyleExtension on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);
}

extension PaddingExtension on BuildContext {
  double get smallPaddingValue => 8;
  double get normalPaddingValue => 16;
  double get largePaddingValue => 24;
  double get extraLargePaddingValue => 48;

  EdgeInsets get smallPadding => EdgeInsets.all(smallPaddingValue);
  EdgeInsets get normalPadding => EdgeInsets.all(normalPaddingValue);
  EdgeInsets get largePadding => EdgeInsets.all(largePaddingValue);
  EdgeInsets get extraLargePadding => EdgeInsets.all(extraLargePaddingValue);

  EdgeInsets get horizontalSmallPadding =>
      EdgeInsets.symmetric(horizontal: smallPaddingValue);
  EdgeInsets get horizontalNormalPadding =>
      EdgeInsets.symmetric(horizontal: normalPaddingValue);
  EdgeInsets get horizontalLargePadding =>
      EdgeInsets.symmetric(horizontal: largePaddingValue);
  EdgeInsets get horizontalExtraLargePadding =>
      EdgeInsets.symmetric(horizontal: extraLargePaddingValue);

  EdgeInsets get verticalSmallPadding =>
      EdgeInsets.symmetric(vertical: smallPaddingValue);
  EdgeInsets get verticalNormalPadding =>
      EdgeInsets.symmetric(vertical: normalPaddingValue);
  EdgeInsets get verticalLargePadding =>
      EdgeInsets.symmetric(vertical: largePaddingValue);
  EdgeInsets get verticalExtraLargePadding =>
      EdgeInsets.symmetric(vertical: extraLargePaddingValue);
}

extension RadiusExtension on BuildContext {
  double get smallRadiusValue => 5;
  double get normalRadiusValue => 10;
  double get largeRadiusValue => 18;
  double get extraLargeRadiusValue => 24;
  double get circleRadiusValue => 50;

  Radius get smallRadius => Radius.circular(smallRadiusValue);
  Radius get normalRadius => Radius.circular(normalRadiusValue);
  Radius get largeRadius => Radius.circular(largeRadiusValue);
  Radius get extraLargeRadius => Radius.circular(extraLargeRadiusValue);
  Radius get circleRadius => Radius.circular(circleRadiusValue);
}

extension BorderExtension on BuildContext {
  BorderRadius get smallBorderRadius => BorderRadius.all(smallRadius);
  BorderRadius get normalBorderRadius => BorderRadius.all(normalRadius);
  BorderRadius get largeBorderRadius => BorderRadius.all(largeRadius);
  BorderRadius get extraLargeBorderRadius => BorderRadius.all(extraLargeRadius);
  BorderRadius get circleBorderRadius => BorderRadius.all(circleRadius);
}
