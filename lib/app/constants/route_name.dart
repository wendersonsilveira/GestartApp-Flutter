class RouteName {
  static const String login = '/';
  static const String signup = '/sign_up';
  static const String forgot_password = '/forgot-password';
  static const String dashboard = '/dashboard';
  static const String condominio = '/condominio';
  static const String ativar_condominio = '/condominio/ativar-condominio';
  static const String cadastros = '/cadastro';
  static const String pets = '/pets';
  static const String assembleia = '/assembleia';
  static const String detalhes_assembleia = '/detalhes_assembleia';
  static const String view_documento = '/view_documento';
  static const String cadastro_pet = '/cadastro_pet';
  static const String boleto = '/boleto';
  static const String detalhe_boleto = '/detalhe_boleto';
  static const String balancetes = '/balancetes';
  static const String documentos = '/documentos';
  static const String infor_condominio = '/infor_condominio';
  static const String home = '/home';
  static const String informativos = '/informativos';
  static const String informativo = '/informativo';
  static const String alterar_perfil = '/alterar_perfil';
  static const String painel_sindico = '/painel_sindico';
  static const String cadastro_espaco = '/cadastro_espaco';
  static const String reservas = '/reservas';
  static const String reservaUnidades = '/reserva_unidades';
  static const String reservaEspacos = '/reserva_espacos';
  static const String reservaHorarios = '/reserva_horarios';
  static const String reservaCadastro = '/reserva_cadastro';
  static const String reservaDados = '/reserva_dados';
  static const String veiculos = '/veiculos';
  static const String cadastroVeiculo = '/cadastroVeirculo';
  static const String pesquisaVoz = '/pesquisa_voz';

  static const String recebimentos = '/recebimentos';

  static const Map allRoutesKeys = {
    'boleto': boleto,
    'fatura': boleto,
    'taxa': boleto,
    'cota': boleto,
    'taxa_condominio': boleto,
    'vencimento': boleto,
    'valor': boleto,
    'codigo_de_barras': boleto,
    'contas': balancetes,
    'prestacao': balancetes,
    'prestacao_contas': balancetes,
    'balancete': balancetes,
    'livro': balancetes,
    'documento': documentos,
    'regimento': documentos,
    'regimento_interno': documentos,
    'convencao': documentos,
    'perfil': 'perfil',
    'cadastro': cadastros,
    'pet': pets,
    'animal': pets,
    'cachorro': pets,
    'gato': pets,
    'veiculo': veiculos,
    'carro': veiculos,
    'moto': veiculos,
    'reserva': reservas,
    'espaco': reservas,
    'reserva_de_espaco': reservas,
    'reserva de espaco': reservas,
    'piscina': reservas,
    'deck': reservas,
    'churrasqueira': reservas,
    'churrasco': reservas,
    'assembleia': assembleia,
    'edital': assembleia,
    'ata': assembleia,
    'painel': painel_sindico, //acrescentar as demais do sindico
  };
}
