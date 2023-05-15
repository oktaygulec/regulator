import 'package:flutter/material.dart';

import '../../helpers/extensions.dart';

class ColorSchemes {
  static ColorSchemes? _instance;
  static ColorSchemes get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = ColorSchemes.init();
      return _instance!;
    }
  }

  ColorSchemes.init();

  static final Map<String, String> _colors = {
    "white": "FAFAFA",
    "lightGray": "F7F7F7",
    "gray": "E9E9E9",
    "darkGray": "636363",
    "disabled": "B8B7B5",
    "black": "212121",
    "lightBlack": "424242",
    "primaryLight": "5A75ED",
    "primary": "4361EE",
    "primaryDark": "2B4EED",
    "secondary": "EE4361",
    "tertiary": "61EE43",
    "bronze": "cd7f32",
    "gold": "FFD700",
    "red": "FF4848",
    "green": "198754",
    "blue":"0f99db",
  };

  // static Future<bool> getColors() async {
  //   Api _api = Api();
  //
  //   final result = await _api.dioGet(url: 'colorScheme', useToken: false);
  //
  //   if(result?.statusCode != 200) return false;
  //
  //   Iterable colors = result!.data;
  //
  //   colors.forEach((c) => _colors[c['name']] = c['value']);
  //
  //   return true;
  // }

  Color get white => HexColor.fromHex(_colors['white']!);
  Color get lightGray => HexColor.fromHex(_colors['lightGray']!);
  Color get gray => HexColor.fromHex(_colors['gray']!);
  Color get darkGray => HexColor.fromHex(_colors['darkGray']!);
  Color get disabled => HexColor.fromHex(_colors['disabled']!);
  Color get black => HexColor.fromHex(_colors['black']!);
  Color get lightBlack => HexColor.fromHex(_colors['lightBlack']!);
  Color get primaryLight => HexColor.fromHex(_colors['primaryLight']!);
  Color get primary => HexColor.fromHex(_colors['primary']!);
  Color get primaryDark => HexColor.fromHex(_colors['primaryDark']!);
  Color get bronze => HexColor.fromHex(_colors['bronze']!);
  Color get gold => HexColor.fromHex(_colors['gold']!);
  Color get red => HexColor.fromHex(_colors['red']!);
  Color get green => HexColor.fromHex(_colors['green']!);
  Color get blue => HexColor.fromHex(_colors['blue']!);
}
