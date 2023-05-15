import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class Globals {
  static toast({required bool error, required String msg}){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: error ? Toast.LENGTH_SHORT: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: error?  Colors.red : Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  static stringToDateTime({required String? datetime}) {
    if(datetime == null) return "";
    String date = datetime.replaceAll(' ', '').replaceAll('T', '').replaceAll('Z', '').replaceAll('-', '').replaceAll(':', '');
    print(date);
    String dateWithT = date.substring(0, 8) + 'T' + date.substring(8);
    var outputFormat = DateFormat('dd.MM.yyyy hh:mm');
    DateTime dateTime = DateTime.parse(dateWithT);
    return outputFormat.format(dateTime);
  }
}
