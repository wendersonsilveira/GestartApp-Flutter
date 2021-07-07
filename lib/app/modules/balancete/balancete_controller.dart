import 'dart:async';

import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/balancete/balancete_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:Gestart/domain/usecases/balancete/get_all_pets_use_case.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'balancete_controller.g.dart';

@Injectable()
class BalanceteController = _BalanceteControllerBase with _$BalanceteController;

abstract class _BalanceteControllerBase with Store {
  final _getBalancetes = getIt.get<GetBalancetesUseCase>();
  List<CondominioEntity> condominios = [
    CondominioEntity(apelido: "Flamboyant", codcon: 47),
    CondominioEntity(apelido: "fff", codcon: 1005)
  ];

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

    allBalancetes = r.data;

    codCon = condominios[0].codcon;

    await filterBalancetes(condominios[0].codcon);
  }

  @action
  Future filterBalancetes(int codcon) {
    isLoading = true;
    balancetes = allBalancetes.where((balancete) {
      return balancete.codcon == codcon;
    }).toList();

    return Future.delayed(Duration(milliseconds: 300), () {
      isLoading = false;
    });
  }
}
