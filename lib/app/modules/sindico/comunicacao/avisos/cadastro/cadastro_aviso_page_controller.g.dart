// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_aviso_page_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CadastroAvisoPageController = BindInject(
  (i) => CadastroAvisoPageController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroAvisoPageController on _CadastroAvisoPageControllerBase, Store {
  final _$createAvisoAsyncAction =
      AsyncAction('_CadastroAvisoPageControllerBase.createAviso');

  @override
  Future<ResourceData<dynamic>> createAviso(
      {dynamic codCon, dynamic title, dynamic descri, dynamic id = 0}) {
    return _$createAvisoAsyncAction.run(() => super
        .createAviso(codCon: codCon, title: title, descri: descri, id: id));
  }

  final _$getAvisoAsyncAction =
      AsyncAction('_CadastroAvisoPageControllerBase.getAviso');

  @override
  Future<AvisoEntity> getAviso(int avisoId) {
    return _$getAvisoAsyncAction.run(() => super.getAviso(avisoId));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
