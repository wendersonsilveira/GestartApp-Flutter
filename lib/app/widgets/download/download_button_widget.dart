import 'dart:io';
import 'package:Gestart/app/widgets/buttons/flat_button_widget.dart';
import 'package:Gestart/data/local/shared_preferences.dart';
import 'package:Gestart/di/di.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:open_file/open_file.dart';
import 'package:android_path_provider/android_path_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadButtonWidget extends StatefulWidget {
  final String fileURL;
  final String fileName;
  final String title;
  final Color color;
  final ShapeBorder shap;
  final double fontSize;
  final Color focusColor;
  final EdgeInsetsGeometry padding;

  const DownloadButtonWidget({
    Key key,
    this.fileURL,
    this.fileName,
    this.title,
    this.color,
    this.shap,
    this.fontSize = 12,
    this.padding,
    this.focusColor,
  }) : super(key: key);

  @override
  _DownloadButtonWidgetState createState() => _DownloadButtonWidgetState();
}

class _DownloadButtonWidgetState extends State<DownloadButtonWidget> {
  double downloadProgress = 0;
  bool downloadStatus = false;
  final sharedPreferences = getIt.get<SharedPreferencesManager>();

  @override
  void initState() {
    super.initState();
  }

  String getExtFile(headers) {
    List<String> arrFil = headers.value('content-disposition').split('.');
    String ext = arrFil.last.replaceAll(r'"', '');
    return ext;
  }

  downloadAndroid() async {
    try {
      if (await Permission.storage.request().isGranted) {
        final dir = await AndroidPathProvider.downloadsPath;
        String _name = widget.fileName.replaceAll(r'/', '_');

        int version = await sharedPreferences.getInt('versaoArquivos');

        _name = 'v_${version}_$_name';

        final String _url = widget.fileURL;

        setState(() {
          downloadStatus = true;
        });

        String fileName = _name;

        if (await File('$dir/$_name').exists()) {
          setState(() {
            downloadStatus = false;
          });
          OpenFile.open('$dir/$_name').then((v) {
            if (v.type == ResultType.noAppToOpen) {
              showMessage(fileName,
                  'Seu dispositivo n??o possui o aplicativo adequado para abrir o arquivo.\n O download foi conclu??do e o aquivo encontra-se na sua pasta de Downloads.');
            }
          });
        } else {
          await Dio().download(_url, '$dir/$_name',
              onReceiveProgress: (int received, int total) {
            if (total != -1) {
              setState(() {
                downloadProgress = (received / total * 100);
              });
            }
          });

          setState(() {
            downloadStatus = false;
          });
          OpenFile.open('$dir/$_name').then((v) {
            if (v.type == ResultType.noAppToOpen) {
              showMessage(fileName,
                  'Seu dispositivo n??o possui o aplicativo adequado para abrir o arquivo.\n O download foi conclu??do e o aquivo encontra-se na sua pasta de Downloads.');
            }
          });
        }
      }
    } on DioError catch (_) {
      setState(() {
        downloadStatus = false;
      });
      showMessage("inacess??vel",
          'Falha ao realizar download. Verifique sua conex??o com a internet.');
    }
  }

  downloadStart() {
    if (Platform.isAndroid)
      downloadAndroid();
    else if (Platform.isIOS) downloadIOS();
  }

  downloadIOS() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      String _name = widget.fileName.replaceAll(r'/', '_');

      int version = await sharedPreferences.getInt('versaoArquivos');

      _name = 'v_${version}_$_name';

      final String _url = widget.fileURL;
      setState(() {
        downloadStatus = true;
      });

      String fileName = _name;

      if (await File(dir.path + '/$_name').exists()) {
        setState(() {
          downloadStatus = false;
        });

        OpenFile.open(dir.path + '/$_name').then((value) {
          if (value.type == ResultType.noAppToOpen) {
            showMessage(fileName,
                'Seu dispositivo n??o possui o aplicativo adequado para abrir o arquivo.\n O download foi conclu??do e o aquivo encontra-se na sua pasta de Downloads.');
          }
        });
      } else {
        await Dio().download(_url, dir.path + '/$_name',
            onReceiveProgress: (int received, int total) {
          if (total != -1) {
            setState(() {
              downloadProgress = (received / total * 100);
            });
          }
        });
        setState(() {
          downloadStatus = false;
        });

        OpenFile.open(dir.path + '/$_name').then((value) {
          if (value.type == ResultType.noAppToOpen) {
            showMessage(fileName,
                'Seu dispositivo n??o possui o aplicativo adequado para abrir o arquivo.\n O download foi conclu??do e o aquivo encontra-se na sua pasta de Downloads.');
          }
        });
      }
    } on DioError catch (_) {
      setState(() {
        downloadStatus = false;
      });
      showMessage('inacess??vel',
          'Falha ao realizar download. Verifique sua conex??o com a internet');
    }
  }

  Future<void> showMessage(String fileName, String message) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              children: [
                Icon(
                  Icons.info,
                  color: Colors.orange,
                ),
                Text(' Aten????o')
              ],
            ),
            content: Container(
              height: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(message),
                  Text('Arquivo: '),
                  Text(
                    fileName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () => Modular.navigator.pop(),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButtonWidget(
      text: widget.title,
      onPressed: widget.fileURL != null ? downloadStart : null,
      cor: widget.color,
      loading: downloadStatus,
      shap: widget.shap,
      focusColor: widget.focusColor,
      fontSize: widget.fontSize,
      padding: widget.padding,
    );
  }
}
