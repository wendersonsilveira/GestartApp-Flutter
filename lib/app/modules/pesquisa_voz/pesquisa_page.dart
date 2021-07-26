import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:string_similarity/string_similarity.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:permission_handler/permission_handler.dart';
import 'package:avatar_glow/avatar_glow.dart';

import 'pesquisa_controller.dart';

class PesquisaPage extends StatefulWidget {
  final String title;
  const PesquisaPage({Key key, this.title = "Pesquisa"}) : super(key: key);

  @override
  _PesquisaPageState createState() => _PesquisaPageState();
}

class _PesquisaPageState extends ModularState<PesquisaPage, PesquisaController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  stt.SpeechToText speech = stt.SpeechToText();
  bool _isListing = false;
  String resultado;
  String emptyMesg;

  @override
  void initState() {
    listeningVoice();
    super.initState();
  }

  listeningVoice() async {
    resultado = null;
    emptyMesg = null;

    if (await Permission.microphone.request().isGranted) {
      setListening(true);
      bool available = await speech.initialize(onStatus: statusListener, onError: errorListener);
      if (available) {
        await speech.listen(onResult: pesquisarVoz);
      } else {
        print("The user has denied the use of speech recognition.");
      }
    }
  }

  pesquisarVoz(SpeechRecognitionResult result) {
    if (result.finalResult) {
      resultado = result.recognizedWords;
      buscarRota();
    }
  }

  statusListener(String status) {
    // print(status);
  }

  errorListener(SpeechRecognitionError error) {
    emptyMesg = 'Nem um recurso correspondente. Tente novamente.';

    stopListern();
  }

  stopListern() {
    speech.stop();
    setListening(false);
  }

  stopAndSearch() {
    if (resultado != null && resultado.isNotEmpty) {
      buscarRota();
      stopListern();
    }
  }

  setListening(bool status) {
    setState(() {
      _isListing = status;
    });
  }

  buscarRota() {
    if (resultado != null && resultado != '') {
      bool match = true;
      var routes = RouteName.allRoutesKeys;
      var keyWord = resultado;
      keyWord = keyWord.replaceAll(r'\\s', '_').toLowerCase();
      for (final key in routes.keys) {
        String k = key;
        double r = k.similarityTo(keyWord);
        if (r > 0.6) {
          Modular.navigator.pushNamed(routes[key]);
          stopListern();
          match = true;

          break;
        }
        match = false;
      }

      if (!match) {
        emptyMesg = 'Nem um recurso correspondente para: $resultado. \n Tente novamente.';
        stopListern();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
        leading: Container(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Pesquise recurso por voz',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              child: _isListing
                  ? Text(
                      'Fale agora..',
                      style: TextStyle(color: AppColorScheme.primaryColor, fontSize: 18),
                    )
                  : Text(
                      'Clique no botão abaixo para iniciar',
                      style: TextStyle(color: AppColorScheme.primaryColor, fontSize: 18),
                    ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: resultado != null && emptyMesg == null
                  ? Text(resultado)
                  : emptyMesg != null
                      ? Text(
                          emptyMesg,
                          style: TextStyle(
                            color: AppColorScheme.feedbackWarningDark2,
                          ),
                          textAlign: TextAlign.center,
                        )
                      : Text(''),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListing,
        glowColor: AppColorScheme.primaryColor,
        endRadius: 75.0,
        duration: Duration(
          seconds: 2,
        ),
        repeatPauseDuration: Duration(microseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          child: Icon(_isListing ? Icons.mic : Icons.mic_none),
          onPressed: !_isListing ? listeningVoice : stopAndSearch,
          backgroundColor: AppColorScheme.primaryColor,
        ),
      ),
    );
  }
}
