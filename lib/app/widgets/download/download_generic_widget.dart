import 'dart:io';

import 'package:Gestart/data/local/shared_preferences.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/reserva/send_params_rel_reserva_entity.dart';
import 'package:Gestart/domain/entities/user/user_entity.dart';
import 'package:Gestart/domain/usecases/user/get_perfil_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:android_path_provider/android_path_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
// import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

class DownloadGenericWidget extends StatefulWidget {
  final SendParamsRelReservaEntity params;
  final String fileURL;
  final String fileName;
  final Function onTap;
  const DownloadGenericWidget(
      {Key key, this.fileName, this.fileURL, this.onTap, this.params})
      : super(key: key);

  @override
  State<DownloadGenericWidget> createState() => _DownloadGenericWidgetState();
}

class _DownloadGenericWidgetState extends State<DownloadGenericWidget> {
  double downloadProgress = 0;
  bool downloadStatus = false;
  final sharedPreferences = getIt.get<SharedPreferencesManager>();
  final _getPerfil = getIt.get<GetPerfilUseCase>();

  ResourceData<UserEntity> perfil;

  @override
  void initState() {
    super.initState();
    // getPerfil();
  }

  // Future<dynamic> getPerfil() async {
  //   perfil = await _getPerfil();
  // }

  downloadStart() async {
    if (Platform.isAndroid)
      downloadAndroid();
    else
      downloadIOS();
  }

  downloadAndroid() async {
    try {
      if (await Permission.storage.request().isGranted) {
        final dir = await AndroidPathProvider.downloadsPath;
        String _name = widget.fileName;
        final String _url = widget.fileURL;
        int version = await sharedPreferences.getInt('versaoArquivos');
        _name = 'v_${version}_$_name';

        setState(() {
          downloadStatus = true;
        });

        String fileName = _name;

        if (await File('$dir/$_name').exists()) {
          setState(() {
            downloadStatus = false;
          });
          print('coisado...');
          Share.shareFiles(['$dir/$_name'], text: 'Great picture');
          // OpenFile.open('$dir/$_name').then((v) {
          //   if (v.type == ResultType.noAppToOpen) {
          //     showMessage(fileName,
          //         'Seu dispositivo não possui o aplicativo adequado para abrir o arquivo.\n O download foi concluído e o aquivo encontra-se na sua pasta de Downloads.');
          //   }
          // });
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
          print('coisado...');
          Share.shareFiles(['$dir/$_name'], text: 'Great picture');
          // OpenFile.open('$dir/$_name').then((v) {
          //   if (v.type == ResultType.noAppToOpen) {
          //     showMessage(fileName,
          //         'Seu dispositivo não possui o aplicativo adequado para abrir o arquivo.\n O download foi concluído e o aquivo encontra-se na sua pasta de Downloads.');
          //   }
          // });
        }
      }
    } on DioError catch (_) {
      setState(() {
        downloadStatus = false;
      });
      showMessage("inacessível",
          'Falha ao realizar download. Verifique sua conexão com a internet.');
    }
  }

  downloadIOS() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      String _name = widget.fileName;
      final String _url = widget.fileURL;

      int version = await sharedPreferences.getInt('versaoArquivos');
      _name = 'v_${version}_$_name';

      setState(() {
        downloadStatus = true;
      });

      String fileName = _name;

      if (await File(dir.path + '/$_name').exists()) {
        setState(() {
          downloadStatus = false;
        });
        print('coisado...');
        Share.shareFiles([dir.path + '/$_name'], text: 'Great picture');
        // OpenFile.open(dir.path + '/$_name').then((value) {
        //   if (value.type == ResultType.noAppToOpen) {
        //     showMessage(fileName,
        //         'Seu dispositivo não possui o aplicativo adequado para abrir o arquivo.\n O download foi concluído e o aquivo encontra-se na sua pasta de Downloads.');
        //   }
        // });
      } else {
        await Dio().download(_url, dir.path + '/$_name',
            onReceiveProgress: (int received, int total) {
          if (total != -1) {
            setState(() {
              downloadProgress = (received / total * 100);
            });
            print('coisado...');
            Share.shareFiles([dir.path + '/$_name'], text: 'Great picture');
            // OpenFile.open(dir.path + '/$_name').then((value) {
            //   if (value.type == ResultType.noAppToOpen) {
            //     showMessage(fileName,
            //         'Seu dispositivo não possui o aplicativo adequado para abrir o arquivo.\n O download foi concluído e o aquivo encontra-se na sua pasta de Downloads.');
            //   }
            // });
          }
        });
        setState(() {
          downloadStatus = false;
        });
        print('coisado...');
        Share.shareFiles(['$dir/$_name'], text: 'Great picture');

        // OpenFile.open('$dir/$_name').then((value) {
        //   if (value.type == ResultType.noAppToOpen) {
        //     showMessage(fileName,
        //         'Seu dispositivo não possui o aplicativo adequado para abrir o arquivo.\n O download foi concluído e o aquivo encontra-se na sua pasta de Downloads.');
        //   }
        // });
      }
    } on DioError catch (_) {
      setState(() {
        downloadStatus = false;
      });
      showMessage('inacessível',
          'Falha ao realizar download. Verifique sua conexão com a internet');
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
            height: 300,
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // showMessage(widget.fileName, 'widget.fileURL');
        // print(widget.params.codCon);
        downloadStart();
      },
      child: Container(
        child: downloadStatus
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              )
            : Icon(FlutterIcons.download_ant),
      ),
    );
  }
}
