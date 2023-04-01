import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';


void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey[700],
    textColor: Colors.white,
    fontSize: 16.0,
  );
}