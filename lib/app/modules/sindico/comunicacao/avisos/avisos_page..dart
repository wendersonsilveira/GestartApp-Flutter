import 'package:Gestart/app/modules/sindico/comunicacao/avisos/cadastro/cadastro_aviso_page_page.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'avisos_page_controller.dart';

class AvisosPage extends StatefulWidget {
  final String title;
  const AvisosPage({Key key, this.title = "Avisos"}) : super(key: key);

  @override
  _AvisosPageState createState() => _AvisosPageState();
}

class _AvisosPageState extends ModularState<AvisosPage, AvisosPageController> {
  @override
  void initState() {
    super.initState();
    controller.getAvisos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(
                    builder: (context) => CadastroAvisoPagePage(condCon: controller.codCon),
                  ))
                  .then((value) => controller.getAvisos());
            },
            child: Text(
              'ADICIONAR',
              style: AppTextTheme.textActionButton,
            ),
          ),
        ],
      ),
      body: Observer(
        builder: (_) => controller.avisos == null
            ? CircularProgressCustom()
            : controller.avisos.length > 0
                ? SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: controller.avisos
                            .map((e) => Card(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              ListTile(
                                                leading: Container(
                                                  height: 45,
                                                  width: 45,
                                                  clipBehavior: Clip.hardEdge,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(45),
                                                    ),
                                                  ),
                                                  child: FadeInImage(
                                                    width: 25,
                                                    image: NetworkImage(e.logo),
                                                    placeholder: AssetImage('assets/images/logo.png'),
                                                  ),
                                                ),
                                                title: Text(e.apelido),
                                                subtitle: Text(UIHelper.formatDate(e.datEmi)),
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .push(MaterialPageRoute(
                                                        builder: (context) => CadastroAvisoPagePage(condCon: controller.codCon, id: e.id),
                                                      ))
                                                      .then((value) => controller.getAvisos());
                                                },
                                              ),
                                              Container(padding: EdgeInsets.symmetric(horizontal: 15), child: Text(e.att)),
                                            ],
                                          ),
                                        ),
                                        Container(padding: EdgeInsets.symmetric(horizontal: 10), child: Icon(Icons.chevron_right)),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  )
                : Text('Nenhum aviso!', textAlign: TextAlign.center),
      ),
    );
  }
}
