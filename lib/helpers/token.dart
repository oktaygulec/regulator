import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Token {
  static const String sharedSecret = '?0,_:W9Z=nxxM}ph=8';
  static const tokenKey = 'toomeToken';
  static saveToken(String? token, String key) async {
    var storage = const FlutterSecureStorage();
    await storage.write(key: tokenKey + key, value: token);
  }
  static Future<String?> readToken(String k) async {
    var storage = const FlutterSecureStorage();
    var value = await storage.read(key: tokenKey + k);

    return value;
  }
  static Future<void> deleteAll() async {
    var storage = const FlutterSecureStorage();
    // await storage.write(key: tokenKey + 'loginKey', value: null);
    await storage.deleteAll();
    // await storage.delete(key: 'loginToken');
  }
}
