import 'package:Gestart/domain/usecases/reserva/create_reserva_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:Gestart/di/di.dart';

part 'cadastro_controller.g.dart';

@Injectable()
class CadastroController = _CadastroControllerBase with _$CadastroController;

abstract class _CadastroControllerBase with Store {
  final _createReserva = getIt.get<CreateReservaUseCase>();

  Future<ResourceData> cadastarReserva(dynamic reserva) {
    return _createReserva(reserva);
  }
}
