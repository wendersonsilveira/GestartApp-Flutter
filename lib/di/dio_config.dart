import 'package:Gestart/data/datasource/assembleia/assembleia_remote_data_source.dart';
import 'package:Gestart/data/datasource/auth/auth_local_data_source.dart';
import 'package:Gestart/data/datasource/boleto/boleto_remote_data_source.dart';
import 'package:Gestart/data/datasource/balancete/balancete_data_source.dart';
import 'package:Gestart/data/datasource/condominio/condominio_remote_data_source.dart';
import 'package:Gestart/data/datasource/documento/documento_remote_data_source.dart';
import 'package:Gestart/data/datasource/feed/feed_data_source.dart';
import 'package:Gestart/data/datasource/notificacao/notificacao_data_source.dart';
import 'package:Gestart/data/datasource/pet/pet_remote_data_source.dart';
import 'package:Gestart/data/datasource/unidade/unidade_remote_data_source.dart';
import 'package:Gestart/data/datasource/user/user_remote_data_source.dart';
import 'package:Gestart/data/local/shared_preferences.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/data/remote/interceptors/auth_interceptor.dart';
import 'package:Gestart/data/repositories/assembleia/assembleia_repository_impl.dart';
import 'package:Gestart/data/repositories/boleto/boleto_repository_impl.dart';
import 'package:Gestart/data/repositories/balancete/pet_repository_impl.dart';
import 'package:Gestart/data/repositories/condominio/condominio_repository_impl.dart';
import 'package:Gestart/data/repositories/documento/boleto_repository_impl.dart';
import 'package:Gestart/data/repositories/feed/feed_repository_impl.dart';
import 'package:Gestart/data/repositories/notificacao/notificacao_repository_impl.dart';
import 'package:Gestart/data/repositories/pet/pet_repository_impl.dart';
import 'package:Gestart/data/repositories/unidade/unidade_repository_impl.dart';
import 'package:Gestart/data/repositories/user/user_repository_impl.dart';
import 'package:Gestart/domain/repositories/assembleia/assembleia_repository.dart';
import 'package:Gestart/domain/repositories/boleto/boleto_repository.dart';
import 'package:Gestart/domain/repositories/balancete/balancete_repository.dart';
import 'package:Gestart/domain/repositories/condominios/condominio_repository.dart';
import 'package:Gestart/domain/repositories/documento/documento_repository.dart';
import 'package:Gestart/domain/repositories/feed/feed_repository.dart';
import 'package:Gestart/domain/repositories/notificacao/notificacao_repository.dart';
import 'package:Gestart/domain/repositories/pet/pet_repository.dart';
import 'package:Gestart/domain/repositories/unidade/unidade_repository.dart';
import 'package:Gestart/domain/repositories/user/user_repository.dart';
import 'package:Gestart/domain/usecases/assembleia/get_editais_use_case.dart';
import 'package:Gestart/domain/usecases/assembleia/get_edital_use_case.dart';
import 'package:Gestart/domain/usecases/auth/check_user_use_case.dart';
import 'package:Gestart/domain/repositories/auth/auth_repository.dart';
import 'package:Gestart/data/repositories/auth/auth_repository_impl.dart';
import 'package:Gestart/data/datasource/auth/auth_remote_data_source.dart';
import 'package:Gestart/domain/usecases/auth/login_use_case.dart';
import 'package:Gestart/domain/usecases/boleto/get_boleto_use_case.dart';
import 'package:Gestart/domain/usecases/boleto/get_boletos_use_case.dart';
import 'package:Gestart/domain/usecases/balancete/get_all_pets_use_case.dart';
import 'package:Gestart/domain/usecases/condominio/get_condominio_ativo_use_case.dart';
import 'package:Gestart/domain/usecases/condominio/get_condominio_por_cpf_use_case.dart';
import 'package:Gestart/domain/usecases/condominio/get_condominios_ativos_use_case.dart';
import 'package:Gestart/domain/usecases/condominio/get_infor_adm_condominios_use_case.dart';
import 'package:Gestart/domain/usecases/documento/get_documento_use_case.dart';
import 'package:Gestart/domain/usecases/feed/get_aviso_use_case.dart';
import 'package:Gestart/domain/usecases/feed/get_informacoes_use_case.dart';
import 'package:Gestart/domain/usecases/notificacao/get_notificacao_use_case.dart';
import 'package:Gestart/domain/usecases/pet/create_pet_use_case.dart';
import 'package:Gestart/domain/usecases/pet/delete_pet_use_case.dart';
import 'package:Gestart/domain/usecases/pet/get_all_pets_use_case.dart';
import 'package:Gestart/domain/usecases/pet/get_pet_use_case.dart';
import 'package:Gestart/domain/usecases/unidade/get_unidades_use_case.dart';
import 'package:Gestart/domain/usecases/user/alterar_senha_use_case.dart';
import 'package:Gestart/domain/usecases/user/checar_senha_use_case.dart';
import 'package:Gestart/domain/usecases/user/create_user_use_case.dart';
import 'package:Gestart/domain/usecases/user/excluir_conta_use_case.dart';
import 'package:Gestart/domain/usecases/user/get_perfil_use_case.dart';
import 'package:Gestart/domain/usecases/user/update_password_use_case.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

Future<GetIt> initGetIt(GetIt get) async {
  WidgetsFlutterBinding.ensureInitialized();
  final gh = GetItHelper(get);
  final dio = Dio();

  // Auth
  gh.factory<AuthInterceptor>(() => AuthInterceptor(get<Dio>()));
  gh.factory<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(get<CustomDio>()));
  gh.factory<AuthLocalDataSource>(
      () => AuthLocalDataSource(get<SharedPreferencesManager>()));
  gh.factory<CheckUserUseCase>(() => CheckUserUseCase(get<AuthRepository>()));
  gh.factory<LoginUseCase>(() => LoginUseCase(get<AuthRepository>()));

  // User
  gh.factory<UserRemoteDataSource>(
      () => UserRemoteDataSource(get<CustomDio>()));
  gh.factory<CreateUserUseCase>(() => CreateUserUseCase(get<UserRepository>()));
  gh.factory<UpdatePasswordUseCase>(
      () => UpdatePasswordUseCase(get<UserRepository>()));
  gh.factory<GetPerfilUseCase>(() => GetPerfilUseCase(get<UserRepository>()));
  gh.factory<AlterarSenhaUseCase>(
      () => AlterarSenhaUseCase(get<UserRepository>()));
  gh.factory<ChecarSenhaUseCase>(
      () => ChecarSenhaUseCase(get<UserRepository>()));
  gh.factory<ExcluirContaUseCase>(
      () => ExcluirContaUseCase(get<UserRepository>()));
  //condominio
  gh.factory<CondominioRemoteDataSource>(
      () => CondominioRemoteDataSource(get<CustomDio>()));
  gh.factory<GetCondominioPorCpfUseCase>(
      () => GetCondominioPorCpfUseCase(get<CondominioRepository>()));
  gh.factory<GetCondominioAtivoUseCase>(
      () => GetCondominioAtivoUseCase(get<CondominioRepository>()));
  gh.factory<GetCondominiosAtivosUseCase>(
      () => GetCondominiosAtivosUseCase(get<CondominioRepository>()));
  gh.factory<GetInforAdmCondominiosUseCase>(
      () => GetInforAdmCondominiosUseCase(get<CondominioRepository>()));

  //assembleia
  gh.factory<AssembleiaRemoteDataSource>(
      () => AssembleiaRemoteDataSource(get<CustomDio>()));
  gh.factory<GetEditaisUseCase>(
      () => GetEditaisUseCase(get<AssembleiaRepository>()));
  gh.factory<GetEditalUseCase>(
      () => GetEditalUseCase(get<AssembleiaRepository>()));

  //pet
  gh.factory<PetRemoteDataSource>(() => PetRemoteDataSource(get<CustomDio>()));
  gh.factory<CreatePetUseCase>(() => CreatePetUseCase(get<PetRepository>()));
  gh.factory<GetAllPetsUseCase>(() => GetAllPetsUseCase(get<PetRepository>()));
  gh.factory<GetPetUseCase>(() => GetPetUseCase(get<PetRepository>()));
  gh.factory<DeletePetUseCase>(() => DeletePetUseCase(get<PetRepository>()));

  //boleto
  gh.factory<BoletoRemoteDataSource>(
      () => BoletoRemoteDataSource(get<CustomDio>()));
  gh.factory<GetBoletosUseCase>(
      () => GetBoletosUseCase(get<BoletoRepository>()));
  gh.factory<GetBoletoUseCase>(() => GetBoletoUseCase(get<BoletoRepository>()));

  //unidade
  gh.factory<UnidadeRemoteDataSource>(
      () => UnidadeRemoteDataSource(get<CustomDio>()));
  gh.factory<GetUnidadesUseCase>(
      () => GetUnidadesUseCase(get<UnidadeRepository>()));

  //balancetes
  gh.factory<BalanceteRemoteDataSource>(
      () => BalanceteRemoteDataSource(get<CustomDio>()));
  gh.factory<GetBalancetesUseCase>(
      () => GetBalancetesUseCase(get<BalanceteRepository>()));

  //documentos
  gh.factory<DocumentoRemoteDataSource>(
      () => DocumentoRemoteDataSource(get<CustomDio>()));
  gh.factory<GetDocumentoUseCase>(
      () => GetDocumentoUseCase(get<DocumentoRepository>()));

  //feed
  gh.factory<FeedRemoteDataSource>(
      () => FeedRemoteDataSource(get<CustomDio>()));
  gh.factory<GetInformacoesUseCase>(
      () => GetInformacoesUseCase(get<FeedRepository>()));
  gh.factory<GetAvisoUseCase>(() => GetAvisoUseCase(get<FeedRepository>()));

  //notifricacao
  gh.factory<NotificacaoRemoteDataSource>(
      () => NotificacaoRemoteDataSource(get<CustomDio>()));
  gh.factory<GetNotificacaoUseCase>(
      () => GetNotificacaoUseCase(get<NotificacaoRepository>()));

  //  Singleton
  gh.singleton<Dio>(dio);
  gh.singleton<SharedPreferencesManager>(SharedPreferencesManager());

  gh.singleton<CustomDio>(CustomDio(get<Dio>(), get<AuthInterceptor>()));

  gh.singleton<AuthRepository>(AuthRepositoryImpl(
      get<AuthRemoteDataSource>(), get<AuthLocalDataSource>()));

  gh.singleton<BoletoRepository>(
      BoletoRepositoryImpl(get<BoletoRemoteDataSource>()));
  gh.singleton<UnidadeRepository>(
      UnidadeRepositoryImpl(get<UnidadeRemoteDataSource>()));

  gh.singleton<FeedRepository>(FeedRepositoryImpl(get<FeedRemoteDataSource>()));

  gh.singleton<NotificacaoRepository>(
      NotificacaoRepositoryImpl(get<NotificacaoRemoteDataSource>()));

  gh.singleton<UserRepository>(UserRepositoryImpl(get<UserRemoteDataSource>()));
  gh.singleton<AssembleiaRepository>(
      AssembleiaRepositoryImpl(get<AssembleiaRemoteDataSource>()));

  gh.singleton<CondominioRepository>(
      CondominioRepositoryImpl(get<CondominioRemoteDataSource>()));

  gh.singleton<PetRepository>(PetRepositoryImpl(get<PetRemoteDataSource>()));
  gh.singleton<BalanceteRepository>(
      BalanceteRepositoryImpl(get<BalanceteRemoteDataSource>()));

  gh.singleton<DocumentoRepository>(
      DocumentoRepositoryImpl(get<DocumentoRemoteDataSource>()));

  return get;
}
