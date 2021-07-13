import 'package:flutter/foundation.dart';

@immutable
class HorarioEspacoEntity {
  final int horiniId;
  final String horIniDescricao;
  final int horfimId;
  final String horfimDescricao;
  final int reservaId;
  final int bloqueado;

  const HorarioEspacoEntity({
    this.horiniId,
    this.horIniDescricao,
    this.horfimId,
    this.horfimDescricao,
    this.reservaId,
    this.bloqueado,
  });

  @override
  String toString() {
    return 'UnidadeEntity(horiniId: $horiniId, horiniDescricao: $horIniDescricao, horfimId: $horfimId, horfimDescricao: $horfimDescricao, reservaId: $reservaId, bloqueado: $bloqueado)';
  }
}
