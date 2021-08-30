import 'dart:io';
import 'package:Gestart/app/widgets/buttons/flat_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:open_file/open_file.dart';
import 'package:android_path_provider/android_path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadButtonWidget extends StatefulWidget {
  final String fileURL;
  final String fileName;
  final String title;
  final Color color;
  final ShapeBorder shap;
  final double fontSize;
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
  }) : super(key: key);

  @override
  _DownloadButtonWidgetState createState() => _DownloadButtonWidgetState();
}

class _DownloadButtonWidgetState extends State<DownloadButtonWidget> {
  double downloadProgress = 0;
  bool downloadStatus = false;

  @override
  void initState() {
    super.initState();
  }

  String getExtFile(headers) {
    List<String> arrFil = headers.value('content-disposition').split('.');
    String ext = arrFil.last.replaceAll(r'"', '');
    return ext;
  }

  downloadStart() async {
    try {
      if (await Permission.storage.request().isGranted) {
        final dir = await AndroidPathProvider.downloadsPath;
        final String _name = widget.fileName.replaceAll(r'/', '_');
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
              showMessage(
                  fileName, 'Seu dispositivo não possui o aplicativo adequado para abrir o arquivo.\n O download foi concluído e o aquivo encontra-se na sua pasta de Downloads.');
            }
          });
        } else {
          await Dio().download(_url, '$dir/$_name', onReceiveProgress: (int received, int total) {
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
              showMessage(
                  fileName, 'Seu dispositivo não possui o aplicativo adequado para abrir o arquivo.\n O download foi concluído e o aquivo encontra-se na sua pasta de Downloads.');
            }
          });
        }
      }
    } on DioError catch (_) {
      setState(() {
        downloadStatus = false;
      });
      showMessage("inacessível", 'Falha ao realizar download. Verifique sua conexão com a internet.');
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
                Text(' Atenção')
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
      onPressed: downloadStart,
      cor: widget.color,
      loading: downloadStatus,
      shap: widget.shap,
      fontSize: widget.fontSize,
      padding: widget.padding,
    );
  }
}
