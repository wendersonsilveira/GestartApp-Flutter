import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:open_file/open_file.dart';
import 'package:android_path_provider/android_path_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io' show Platform;

class DownloadListItemWidget extends StatefulWidget {
  final String fileURL;
  final String fileName;
  final Widget title;
  final Widget subtitle;
  final Icon leading;
  final Icon trailing;
  final Function onTap;
  final bool download;

  const DownloadListItemWidget({Key key, this.fileURL, this.fileName, this.title, this.subtitle, this.leading, this.trailing, this.onTap, this.download = true}) : super(key: key);

  @override
  _DownloadListItemWidgetState createState() => _DownloadListItemWidgetState();
}

class _DownloadListItemWidgetState extends State<DownloadListItemWidget> {
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

  downloadAndroid() async {
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

  downloadStart() async {
    if (Platform.isAndroid)
      downloadAndroid();
    else
      downloadIOS();
  }

  downloadIOS() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final String _name = widget.fileName.replaceAll(r'/', '_');
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
            showMessage(
                fileName, 'Seu dispositivo não possui o aplicativo adequado para abrir o arquivo.\n O download foi concluído e o aquivo encontra-se na sua pasta de Downloads.');
          }
        });
      } else {
        await Dio().download(_url, dir.path + '/$_name', onReceiveProgress: (int received, int total) {
          if (total != -1) {
            setState(() {
              downloadProgress = (received / total * 100);
            });
            OpenFile.open(dir.path + '/$_name').then((value) {
              if (value.type == ResultType.noAppToOpen) {
                showMessage(fileName,
                    'Seu dispositivo não possui o aplicativo adequado para abrir o arquivo.\n O download foi concluído e o aquivo encontra-se na sua pasta de Downloads.');
              }
            });
          }
        });
        setState(() {
          downloadStatus = false;
        });
        OpenFile.open('$dir/$_name').then((value) {
          if (value.type == ResultType.noAppToOpen) {
            showMessage(
                fileName, 'Seu dispositivo não possui o aplicativo adequado para abrir o arquivo.\n O download foi concluído e o aquivo encontra-se na sua pasta de Downloads.');
          }
        });
      }
    } on DioError catch (_) {
      setState(() {
        downloadStatus = false;
      });
      showMessage('inacessível', 'Falha ao realizar download. Verifique sua conexão com a internet');
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
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: widget.leading,
        title: widget.title,
        subtitle: widget.subtitle,
        trailing: downloadStatus ? CircularProgressIndicator() : widget.trailing,
        onTap: widget.onTap != null
            ? () {
                widget.onTap();
                if (widget.download) {
                  downloadStart();
                }
              }
            : downloadStart,
      ),
    );
  }
}
