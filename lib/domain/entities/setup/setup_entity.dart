import 'package:Gestart/domain/entities/setup/setup_reserva_entity.dart';
import 'package:flutter/foundation.dart';

@immutable
class SetupEntity {
  final int versaoArquivos;
  final SetupReservaEntity setupReserva;
  final String iosStoreVersion;
  final String androidStoreVersion;
  final int forceUpdate;

  const SetupEntity(
      {this.versaoArquivos,
      this.setupReserva,
      this.androidStoreVersion,
      this.iosStoreVersion,
      this.forceUpdate});

  @override
  String toString() {
    return 'SetupEntity(versaoSetup: $versaoArquivos, setupReserva: $setupReserva )';
  }
}
