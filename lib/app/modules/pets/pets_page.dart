import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pets_controller.dart';

class PetsPage extends StatefulWidget {
  final String title;
  const PetsPage({Key key, this.title = "Pets"}) : super(key: key);

  @override
  _PetsPageState createState() => _PetsPageState();
}

class _PetsPageState extends ModularState<PetsPage, PetsController> {
  @override
  void initState() {
    controller.getPets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
      ),
      body: Container(
        child: Observer(
          builder: (_) => controller.pets == null
              ? Center(child: CircularProgressCustom())
              : Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.pets.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Text('- ${controller.pets.data[0].nome}');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
