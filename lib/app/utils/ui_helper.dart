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

  static String idHoraDescricao(int idHora) {
    String descricao;
    switch (idHora) {
      case 0:
        descricao = '00:00 hrs';
        break;
      case 1:
        descricao = '30 minutos';
        break;
      case 2:
        descricao = '01:00 hr';
        break;
      case 3:
        descricao = '01:30 hrs';
        break;
      case 4:
        descricao = '02:00 hrs';
        break;
      case 5:
        descricao = '02:30 hrs';
        break;
      case 6:
        descricao = '03:00 hrs';
        break;
      case 7:
        descricao = '03:30 hrs';
        break;
      case 8:
        descricao = '04:00 hrs';
        break;
      case 9:
        descricao = '04:30 hrs';
        break;
      case 10:
        descricao = '05:00 hrs';
        break;
      case 11:
        descricao = '05:30 hrs';
        break;
      case 12:
        descricao = '06:00 hrs';
        break;
      case 13:
        descricao = '06:30 hrs';
        break;
      case 14:
        descricao = '07:00 hrs';
        break;
      case 15:
        descricao = '07:30 hrs';
        break;
      case 16:
        descricao = '08:00 hrs';
        break;
      case 17:
        descricao = '08:30 hrs';
        break;
      case 18:
        descricao = '09:00 hrs';
        break;
      case 19:
        descricao = '09:30 hrs';
        break;
      case 20:
        descricao = '10:00 hrs';
        break;
      case 21:
        descricao = '10:30 hrs';
        break;
      case 22:
        descricao = '11:00 hrs';
        break;
      case 23:
        descricao = '11:30 hrs';
        break;
      case 24:
        descricao = '12:00 hrs';
        break;
      case 25:
        descricao = '12:30 hrs';
        break;
      case 26:
        descricao = '13:00 hrs';
        break;
      case 27:
        descricao = '13:30 hrs';
        break;
      case 28:
        descricao = '14:00 hrs';
        break;
      case 29:
        descricao = '14:30 hrs';
        break;
      case 30:
        descricao = '15:00 hrs';
        break;
      case 31:
        descricao = '15:30 hrs';
        break;
      case 32:
        descricao = '16:00 hrs';
        break;
      case 33:
        descricao = '16:30 hrs';
        break;
      case 34:
        descricao = '17:00 hrs';
        break;
      case 35:
        descricao = '17:30 hrs';
        break;
      case 36:
        descricao = '18:00 hrs';
        break;
      case 37:
        descricao = '18:30 hrs';
        break;
      case 38:
        descricao = '19:00 hrs';
        break;
      case 39:
        descricao = '19:30 hrs';
        break;
      case 40:
        descricao = '20:00 hrs';
        break;
      case 41:
        descricao = '20:30 hrs';
        break;
      case 42:
        descricao = '21:00 hrs';
        break;
      case 43:
        descricao = '21:30 hrs';
        break;
      case 44:
        descricao = '22:00 hrs';
        break;
      case 45:
        descricao = '22:30 hrs';
        break;
      case 46:
        descricao = '23:00 hrs';
        break;
      case 47:
        descricao = '23:30 hrs';
        break;
      case 48:
        descricao = '1 dia';
        break;
      case 49:
        descricao = '1 dia';
        break;
      case 50:
        descricao = '2 dias';
        break;
      case 51:
        descricao = '3 dias';
        break;
      case 52:
        descricao = '4 dias';
        break;
      case 53:
        descricao = '5 dias';
        break;
      case 54:
        descricao = '6 dias';
        break;
      case 55:
        descricao = '1 semana';
        break;
      case 56:
        descricao = '2 semanas';
        break;
      case 57:
        descricao = '3 semanas';
        break;
      case 58:
        descricao = '1 mês';
        break;
      case 59:
        descricao = '2 mêses';
        break;
      case 60:
        descricao = '3 meses';
        break;
      case 61:
        descricao = '4 meses';
        break;
      case 62:
        descricao = '5 meses';
        break;
      case 63:
        descricao = '6 meses';
        break;
      case 64:
        descricao = '7 meses';
        break;
      case 65:
        descricao = '8 meses';
        break;
      case 66:
        descricao = '9 meses';
        break;
      case 67:
        descricao = '10 meses';
        break;
      case 68:
        descricao = '11 meses';
        break;
      case 69:
        descricao = '1 ano';
        break;
      default:
        descricao = '15 dias';
    }
    return descricao;
  }

  static String diaSemanaDate(DateTime dateTime) {
    final day = dateTime.weekday;
    String descricao;
    switch (day) {
      case 1:
        descricao = 'Segunda';
        break;
      case 2:
        descricao = 'Terça';
        break;
      case 3:
        descricao = 'Quarta';
        break;
      case 4:
        descricao = 'Quinta';
        break;
      case 5:
        descricao = 'Sexta';
        break;
      case 6:
        descricao = 'Sábado';
        break;
      default:
        descricao = 'Domingo';
    }

    return descricao;
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

  static String formatDateMesAno(DateTime dateTime, [String separator]) {
    separator = separator == null ? '/' : separator;
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    return '$day$separator$month';
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
      String value, GlobalKey<ScaffoldState> _scaffoldKey,
      {context}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(new SnackBar(content: new Text(value)));
  }
}
