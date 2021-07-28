import 'package:Gestart/app/modules/sindico/controle_recebimentos/controle_recebimentos_page.dart';
import 'package:Gestart/app/modules/sindico/pages/reserva_espaco_page.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/inputs/dropdown_button_field3.widget.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'component/button_menu_sindico_widget.dart';
import 'sindico_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SindicoPage extends StatefulWidget {
  final String title;
  const SindicoPage({Key key, this.title = "Painel do Síndico"}) : super(key: key);

  @override
  _SindicoPageState createState() => _SindicoPageState();
}

class _SindicoPageState extends ModularState<SindicoPage, SindicoController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    controller.init();
    super.initState();
  }

  PageController controllerPages = PageController(initialPage: 0);

  mudarPage(int indice) {
    setState(() {
      controllerPages.animateToPage(indice, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        mudarPage(0);
        return false;
      },
      child: Scaffold(
        appBar: AppBarCustom(
          context,
          title: Text(widget.title),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              if (controllerPages.page == 0.0)
                Modular.navigator.pop();
              else
                mudarPage(0);
            },
          ),
        ),
        body: Observer(
          builder: (_) => controller.unidades.status == Status.loading
              ? CircularProgressCustom()
              : Column(
                  children: <Widget>[
                    Container(
                      height: 110.h,
                      child: DropdownButtonField3Widget(
                        label: 'Condominios',
                        hint: 'Selecione',
                        value: controller.unidades.data[0].codord,
                        list: controller.unidades.data != null ? controller.unidades.data : [],
                        onChanged: (value) {
                          controller.alterarSelecao(value);
                        },
                      ),
                    ),
                    Expanded(
                      child: PageView(
                        controller: controllerPages,
                        physics: new NeverScrollableScrollPhysics(),
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                            child: Column(
                              children: [
                                Text(
                                  'MENU DO SÍNDICO',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                GridView.count(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    crossAxisCount: 3,
                                    childAspectRatio: 100.w / 90.h,
                                    children: List.generate(controller.menus.length, (index) {
                                      return ButtonMenuWidget(
                                        icone: controller.menus[index]['icon'],
                                        descricao: controller.menus[index]['title'],
                                        onPress: () => mudarPage(controller.menus[index]['indice']),
                                      );
                                    })),
                              ],
                            ),
                          ),
                          InicialPage(),
                          ControleRecebimentosPage(),
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
