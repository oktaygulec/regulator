import 'dart:io';
import 'package:dio/dio.dart';
import '../helpers/token.dart';

class Api {
  static const baseUrl = "http://192.168.100.102:5010/api/";
  // static const baseUrl = "http://192.168.0.21:5010/api/";
  // static const baseUrl = "https://api.ciktigitti.com/api/";
  // static const baseUrl = "http://10.0.0.25:5010/api/";
  // static const baseUrl = "http://172.20.10.2:5010/api/";
  // static const baseUrl = "http://192.168.144.55:5010/api/";
  // static const baseUrl = "https://ciktigittidev.herokuapp.com/api/";

  String? token;
  var dio = Dio();

  setHeaderWithOutToken() {
    Map<String, String> q = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    return q;
  }

  setHeaderWithToken() async {
    final tkn = await Token.readToken('loginToken');
    if (tkn != null) {
      token = tkn;
    }
    Map<String, String> q = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer ' + (token ?? '')
    };
    print(q);
    return q;
  }

  Future<Response?> dioGet({required String url, bool useToken = true}) async {
    Map<String, String> headers;
    if (useToken) {
      headers = await setHeaderWithToken();
    } else {
      headers = setHeaderWithOutToken();
    }
    try {
      print('DIO GET : ${baseUrl + url}');
      Response response = await Dio().get(baseUrl + url, options: Options(headers: headers));
      return response;
    } on DioError catch  ( e) {
      return e.response;
    }
  }

  Future<Response?> dioPost(
      {required String url, bool useToken = true, Map<String, dynamic>? obj}) async {
    Map<String, String> headers;
    if (useToken) {
      headers = await setHeaderWithToken();
    } else {
      headers = setHeaderWithOutToken();
    }
    try {
      Response response =
          await Dio().post(baseUrl + url, data: obj, options: Options(headers: headers));
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response?> dioPut(
      {required String url, bool useToken = true, Map<String, dynamic>? obj}) async {
    Map<String, String> headers;
    if (useToken) {
      headers = await setHeaderWithToken();
    } else {
      headers = setHeaderWithOutToken();
    }
    try {
      Response response =
          await Dio().put(baseUrl + url, data: obj, options: Options(headers: headers));
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response?> dioPostMultiPart(
      {required String url, required FormData obj, bool useToken = true}) async {
    Map<String, String> headers;
    if (useToken) {
      headers = await setHeaderWithToken();
    } else {
      headers = setHeaderWithOutToken();
    }
    try {
      Response response =
          await Dio().post(baseUrl + url, data: obj, options: Options(headers: headers));
      return response;
    } catch (e) {
      return null;
    }
  }
}
