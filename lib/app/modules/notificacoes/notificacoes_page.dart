import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/empty/empt_widget.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'notificacoes_controller.dart';

class NotificacoesPage extends StatefulWidget {
  final String title;
  const NotificacoesPage({Key key, this.title = "Notificações"})
      : super(key: key);

  @override
  _NotificacoesPageState createState() => _NotificacoesPageState();
}

class _NotificacoesPageState
    extends ModularState<NotificacoesPage, NotificacoesController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    controller.init();
    super.initState();
  }

  sendToDetail(int id, String page) {
    Modular.navigator.pushNamed(page, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(
          context,
          leading: Container(),
          title: Text(widget.title),
        ),
        body: Observer(
            builder: (_) => controller.notificacoes.status == Status.loading
                ? CircularProgressCustom()
                : controller.notificacoes.data.length == 0
                    ? EmptyWidget(
                        descricao: 'Sem Notificações!',
                      )
                    : Container(
                        child: ListView.builder(
                          itemCount: controller.notificacoes.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                                child: ListTile(
                              title: Column(
                                children: [
                                  Text(controller
                                      .notificacoes.data[index].titulo),
                                  Text(controller
                                      .notificacoes.data[index].mensagem),
                                ],
                              ),
                              onTap: () {
                                sendToDetail(
                                    controller.notificacoes.data[index].itemId,
                                    controller.notificacoes.data[index].openPage
                                        .trim());
                              },
                              subtitle: Text(UIHelper.formatDate(controller
                                  .notificacoes.data[index].createAt)),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(controller
                                    .notificacoes.data[index].linkPhoto),
                              ),
                            ));
                          },
                        ),
                      )));
  }
}
