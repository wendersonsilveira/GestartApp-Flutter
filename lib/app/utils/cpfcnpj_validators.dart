class CPF {
  // Formatar número de CPF
  static String format(String cpf) {
    if (cpf == null) return null;

    // Obter somente os números do CPF
    var numeros = cpf.replaceAll(RegExp(r'[^0-9]'), '');

    // Testar se o CPF possui 11 dígitos
    if (numeros.length != 11) return cpf;

    // Retornar CPF formatado
    return "${numeros.substring(0, 3)}.${numeros.substring(3, 6)}.${numeros.substring(6, 9)}-${numeros.substring(9)}";
  }

  // Validar número de CPF
  static bool isValid(String cpf) {
    if (cpf == null) return false;

    // Obter somente os números do CPF
    var numeros = cpf.replaceAll(RegExp(r'[^0-9]'), '');

    // Testar se o CPF possui 11 dígitos
    if (numeros.length != 11) return false;

    // Testar se todos os dígitos do CPF são iguais
    if (RegExp(r'^(\d)\1*$').hasMatch(numeros)) return false;

    // Dividir dígitos
    List<int> digitos =
        numeros.split('').map((String d) => int.parse(d)).toList();

    // Calcular o primeiro dígito verificador
    var calc_dv1 = 0;
    for (var i in Iterable<int>.generate(9, (i) => 10 - i)) {
      calc_dv1 += digitos[10 - i] * i;
    }
    calc_dv1 %= 11;
    var dv1 = calc_dv1 < 2 ? 0 : 11 - calc_dv1;

    // Testar o primeiro dígito verificado
    if (digitos[9] != dv1) return false;

    // Calcular o segundo dígito verificador
    var calc_dv2 = 0;
    for (var i in Iterable<int>.generate(10, (i) => 11 - i)) {
      calc_dv2 += digitos[11 - i] * i;
    }
    calc_dv2 %= 11;
    var dv2 = calc_dv2 < 2 ? 0 : 11 - calc_dv2;

    // Testar o segundo dígito verificador
    if (digitos[10] != dv2) return false;

    return true;
  }
}

class CNPJ {
  // Formatar número de CNPJ
  static String format(String cnpj) {
    if (cnpj == null) return null;

    // Obter somente os números do CNPJ
    var numeros = cnpj.replaceAll(RegExp(r'[^0-9]'), '');

    // Testar se o CNPJ possui 14 dígitos
    if (numeros.length != 14) return cnpj;

    // Retornar CPF formatado
    return "${numeros.substring(0, 2)}.${numeros.substring(2, 5)}.${numeros.substring(5, 8)}/${numeros.substring(8, 12)}-${numeros.substring(12)}";
  }

  // Validar número de CNPJ
  static bool isValid(String cnpj) {
    if (cnpj == null) return false;

    // Obter somente os números do CNPJ
    var numeros = cnpj.replaceAll(RegExp(r'[^0-9]'), '');

    // Testar se o CNPJ possui 14 dígitos
    if (numeros.length != 14) return false;

    // Testar se todos os dígitos do CNPJ são iguais
    if (RegExp(r'^(\d)\1*$').hasMatch(numeros)) return false;

    // Dividir dígitos
    List<int> digitos =
        numeros.split('').map((String d) => int.parse(d)).toList();

    // Calcular o primeiro dígito verificador
    var calc_dv1 = 0;
    var j = 0;
    for (var i in Iterable<int>.generate(12, (i) => i < 4 ? 5 - i : 13 - i)) {
      calc_dv1 += digitos[j++] * i;
    }
    calc_dv1 %= 11;
    var dv1 = calc_dv1 < 2 ? 0 : 11 - calc_dv1;

    // Testar o primeiro dígito verificado
    if (digitos[12] != dv1) return false;

    // Calcular o segundo dígito verificador
    var calc_dv2 = 0;
    j = 0;
    for (var i in Iterable<int>.generate(13, (i) => i < 5 ? 6 - i : 14 - i)) {
      calc_dv2 += digitos[j++] * i;
    }
    calc_dv2 %= 11;
    var dv2 = calc_dv2 < 2 ? 0 : 11 - calc_dv2;

    // Testar o segundo dígito verificador
    if (digitos[13] != dv2) return false;

    return true;
  }
}
