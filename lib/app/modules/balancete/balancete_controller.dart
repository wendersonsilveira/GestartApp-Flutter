import 'dart:async';

import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/balancete/balancete_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominios_ativos_entity.dart';
import 'package:Gestart/domain/usecases/balancete/get_all_pets_use_case.dart';
import 'package:Gestart/domain/usecases/condominio/get_condominios_ativos_use_case.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'balancete_controller.g.dart';

@Injectable()
class BalanceteController = _BalanceteControllerBase with _$BalanceteController;

abstract class _BalanceteControllerBase with Store {
  final _getBalancetes = getIt.get<GetBalancetesUseCase>();
  final _getCondominios = getIt.get<GetCondominiosAtivosUseCase>();

  @observable
  List<CondominiosAtivosEntity> condominios;

  @observable
  int codCon;

  @observable
  bool isLoading = true;

  @observable
  List<BalanceteEntity> balancetes;
  List<BalanceteEntity> allBalancetes;

  @action
  Future getBalancetes() async {
    final r = await _getBalancetes();
    final rc = await _getCondominios();

    var storage = await SharedPreferences.getInstance();
    int cod = storage.getInt('codCon');

    if (codCon == null) {
      if (cod != null) {
        codCon = cod;
      } else {
        codCon = condominios[0].codcon;
      }
    } else {
      codCon = condominios[0].codcon;
    }

    allBalancetes = r.data;
    condominios = rc.data;
    codCon = codCon == null ? condominios[0].codcon : codCon;

    await filterBalancetes(codCon);
  }

  @action
  Future filterBalancetes(int id) {
    codCon = id;
    isLoading = true;
    balancetes = allBalancetes.where((balancete) {
      return balancete.codcon == id;
    }).toList();

    return Future.delayed(Duration(milliseconds: 300), () {
      isLoading = false;
    });
  }
}
