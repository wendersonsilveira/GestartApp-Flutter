import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UIHelper {
  static String formatDateFromDateTime(DateTime dateTime) {
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year.toString();
    return '$day/$month/$year';
  }

  static String formatDateFromDateTimeReverse(DateTime dateTime) {
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year.toString();
    return '$year-$month-$day';
  }

  static String formatTimeFromTimeOfDay(TimeOfDay timeOfDay) {
    final hour = timeOfDay.hour.toString().padLeft(2, '0');
    final minute = timeOfDay.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  static String formatDateTime(DateTime dateTime) {
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year.toString().padLeft(2, '0');
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$day/$month/$year às $hour:$minute';
  }

  static String formatDate(DateTime dateTime, [String separator]) {
    separator = separator == null ? '/' : separator;
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year.toString().padLeft(2, '0');
    return '$day$separator$month$separator$year';
  }

  static String formatTime(DateTime dateTime, [String separator]) {
    separator = separator == null ? ':' : separator;
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return ' $hour$separator$minute';
  }

  static String formatDateFromString(String date) {
    DateTime d = DateTime.parse(date);
    final f = DateFormat('dd/MM/yyyy');
    return f.format(d);
  }

  static String moneyFormat(double priceDouble) {
    return NumberFormat.simpleCurrency(locale: 'pt').format(priceDouble);
  }

  static String moneyFormatInt(int priceDouble) {
    return NumberFormat.simpleCurrency(locale: 'pt').format(priceDouble);
  }

  static void saveStorage(key, value1) {
    SharedPreferences.getInstance()
        .then((value) => value.setString(key, value1.toString()));
  }

  static Future<String> getStorage(key) {
    return SharedPreferences.getInstance()
        .then((value) => value.getString(key));
  }

  static Future<int> getStorageInt(key) {
    return SharedPreferences.getInstance().then((value) => value.getInt(key));
  }

  static void showInSnackBar(
      String value, GlobalKey<ScaffoldState> _scaffoldKey) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }
}
