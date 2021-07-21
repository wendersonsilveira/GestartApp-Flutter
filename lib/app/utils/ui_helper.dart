import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:android_path_provider/android_path_provider.dart';

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

  static String formatDate(DateTime dateTime) {
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year.toString().padLeft(2, '0');
    return '$day/$month/$year';
  }

  static String formatTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return ' $hour:$minute';
  }

  static String moneyFormat(double priceDouble) {
    return NumberFormat.simpleCurrency(locale: 'pt').format(priceDouble);
  }

  static String moneyFormatInt(int priceDouble) {
    return NumberFormat.simpleCurrency(locale: 'pt').format(priceDouble);
  }

  static String formaUrlImage(String enpoint) {
    return 'http://ineedapiapp-prod.us-east-2.elasticbeanstalk.com/$enpoint';
  }

  static Future<void> downloadFiles(String _url, String _name, BuildContext context, double downloadProgress, Function setProgress) async {
    final dir = await AndroidPathProvider.downloadsPath;
    String fullName;
    Dio().download(_url, (headers) {
      var arrFil = headers.value('content-disposition').split('.');
      String ext = arrFil[1].replaceAll(r'"', '');
      fullName = '$dir/$_name.$ext';
      return fullName;
    }, onReceiveProgress: setProgress).then((value) {
      OpenFile.open(fullName).then((v) => print(v.type));
    });

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Baixando aquivo...'),
          content: SingleChildScrollView(
            child: Observer(
              builder: (_) => Text(downloadProgress.toString()),
            ),
          ),
          actions: [],
        );
      },
    );
  }
}
