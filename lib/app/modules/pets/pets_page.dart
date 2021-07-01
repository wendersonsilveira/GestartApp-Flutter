import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pets_controller.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  _editarPet() {
    Modular.navigator.pushNamed(RouteName.cadastro_pet);
    // Modular.navigator.pushNamed(RouteName.pets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        actions: [
          RaisedButton(
            onPressed: () => _editarPet(),
            child: Text('Cadastro'),
          )
        ],
        title: Text(widget.title),
      ),
      body: Container(
        child: Observer(
          builder: (_) => controller.pets == null
              ? Center(child: CircularProgressCustom())
              : Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.pets.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: ListTile(
                                title: Text(
                                  '${controller.pets.data[index].tipo}  ${controller.pets.data[0].raca}',
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF8A8A8A)),
                                ),
                                subtitle: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Nome: ${controller.pets.data[index].nome}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '/ ${controller.pets.data[index].porte}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                leading: Container(
                                  padding: EdgeInsets.only(top: 9),
                                  child: Icon(
                                    Icons.pets,
                                    size: 50.h,
                                    color: AppColorScheme.primaryColor,
                                  ),
                                ),
                                onTap: () => _editarPet(),
                              ),
                            );
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
