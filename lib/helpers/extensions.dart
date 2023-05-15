import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../theme/color/color_schemes.dart';
import '../theme/extension/style_extension.dart';

extension Ex on double {
  double toPrecision(int n) {
    return double.parse(toStringAsFixed(n));
  }
}

extension Exint on int {
  int toTop(int number, int d) {
    return int.parse(
        (double.tryParse((number / d).toString()) ?? 0).toStringAsFixed(0));
  }
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension KapoImage on CachedNetworkImage {
  static CachedNetworkImage img(
      {required String imageUrl,
      BoxFit? fit,
      double? width,
      double? height,
      IconData? icon}) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      width: width,
      height: height,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(color: ColorSchemes.instance.primary),
      ),
      errorWidget: (context, url, error) => Container(
        padding: context.normalPadding,
        color: ColorSchemes.instance.primary,
        child: icon != null
            ? Icon(
                icon,
                color: ColorSchemes.instance.white,
              )
            : Image.asset("assets/logo.png"),
      ),
    );
  }
}

extension DateToFormattedString on DateTime {
  String get toFormattedString {
    var _day = day < 10 ? "0$day" : day;
    var _month = month < 10 ? "0$month" : month;
    var _hour = hour < 10 ? "0$hour" : hour;
    var _minute = minute < 10 ? "0$minute" : minute;

    return "$_day.$_month.$year $_hour:$_minute";
  }
}
