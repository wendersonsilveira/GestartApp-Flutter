import 'package:Gestart/domain/entities/setup/setup_reserva_entity.dart';
import 'package:flutter/foundation.dart';

@immutable
class SetupEntity {
  final int versaoArquivos;
  final SetupReservaEntity setupReserva;
  const SetupEntity({this.versaoArquivos, this.setupReserva});

  @override
  String toString() {
    return 'SetupEntity(versaoSetup: $versaoArquivos, setupReserva: $setupReserva )';
  }
}
