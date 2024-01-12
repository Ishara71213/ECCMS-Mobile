import 'dart:convert';
import 'package:another_flushbar/flushbar.dart';
import 'package:eccms/Core/constants/storage_keys_const.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utility {
  static Map<String, String> httpHeaders(
      SharedPreferences prefs, Map<String, String> items) {
    items['Content-Type'] = "application/json; charset=UTF-8";
    items['connection'] = "keep-alive";
    if (prefs.containsKey(StorageKeys.token)) {
      String? token = prefs.getString(StorageKeys.token);
      items['Authorization'] = "Bearer ${token!}";
    }
    return items;
  }

  static error(BuildContext context, String message) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      icon: const Icon(
        Icons.error,
        color: Colors.red,
      ),
      title: 'Error',
      message: message,
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  static warning(BuildContext context, String message) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      icon: const Icon(
        Icons.warning,
        color: Colors.orange,
      ),
      title: 'Warning',
      message: message,
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  static success(BuildContext context, String message) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      icon: const Icon(
        Icons.check,
        color: Colors.green,
      ),
      title: 'Success',
      message: message,
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  static void logError(SharedPreferences prefs, String api, String? error) {
    debugPrint('ERROR:$api:${error!}');
    List? items = [];
    if (prefs.containsKey(StorageKeys.errorLogs)) {
      items = json.decode(prefs.get(StorageKeys.errorLogs) as String);
    }

    final DateTime now = DateTime.now();
    final String date = DateFormat('yyyy-MM-dd hh:mm:ss a').format(now);
    items = [
      {
        "date": date,
        "api": api,
        'error': error,
      },
      ...items!
    ];
    prefs.setString(StorageKeys.errorLogs, json.encode(items));
  }
}
