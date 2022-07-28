abstract class Validators {
  static String string({String value, String message}) {
    return value.isNotEmpty ? null : message;
  }

  static String removeSymbols(String value) {
    return value.replaceAll(new RegExp(r'[^\w\s]+'), '');
  }

  static String name(String value) {
    if (value == null || value.isEmpty) {
      return "Nome em branco";
    }

    return null;
  }

  static String empty(String value) {
    if (value == null || value.isEmpty) {
      return "Campo em branco";
    }

    return null;
  }

  static String fullName(String value) {
    if (value == null || value.isEmpty) {
      return "Nome completo em branco";
    }

    final list = value.split(' ');

    if (list.length == 1 || list[1].isEmpty) {
      return "Nome completo inválido";
    } else {
      return null;
    }
  }

  static String cpfOrCnpj(String value) {
    if (value == null || value.isEmpty) {
      return "CPF ou CNPJ em branco";
    }

    if (cpfIsValid(value)) {
      return null;
    } else if (cnpjIsValid(value)) {
      return null;
    } else {
      return "CPF ou CNPJ inválido";
    }
  }

  static bool cnpjIsValid(String cnpj) {
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
    var calcDv1 = 0;
    var j = 0;
    for (var i in Iterable<int>.generate(12, (i) => i < 4 ? 5 - i : 13 - i)) {
      calcDv1 += digitos[j++] * i;
    }
    calcDv1 %= 11;
    var dv1 = calcDv1 < 2 ? 0 : 11 - calcDv1;

    // Testar o primeiro dígito verificado
    if (digitos[12] != dv1) return false;

    // Calcular o segundo dígito verificador
    var calcDv2 = 0;
    j = 0;
    for (var i in Iterable<int>.generate(13, (i) => i < 5 ? 6 - i : 14 - i)) {
      calcDv2 += digitos[j++] * i;
    }
    calcDv2 %= 11;
    var dv2 = calcDv2 < 2 ? 0 : 11 - calcDv2;

    // Testar o segundo dígito verificador
    if (digitos[13] != dv2) return false;

    return true;
  }

  static bool cpfIsValid(String cpf) {
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
    var calcDv1 = 0;
    for (var i in Iterable<int>.generate(9, (i) => 10 - i)) {
      calcDv1 += digitos[10 - i] * i;
    }
    calcDv1 %= 11;
    var dv1 = calcDv1 < 2 ? 0 : 11 - calcDv1;

    // Testar o primeiro dígito verificado
    if (digitos[9] != dv1) return false;

    // Calcular o segundo dígito verificador
    var calcDv2 = 0;
    for (var i in Iterable<int>.generate(10, (i) => 11 - i)) {
      calcDv2 += digitos[11 - i] * i;
    }
    calcDv2 %= 11;
    var dv2 = calcDv2 < 2 ? 0 : 11 - calcDv2;

    // Testar o segundo dígito verificador
    if (digitos[10] != dv2) return false;

    return true;
  }

  static String phone(String value) {
    if (value == null || value.isEmpty) {
      return "Telefone em branco";
    }

    final split = value
        .replaceAll(' ', '')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll('-', '');
    if (split.length == 11) {
      return null;
    } else {
      return "Telefone inválido";
    }
  }

  static String email(String email) {
    RegExp _email = RegExp(
        r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");

    bool validarEmail(String str) {
      return _email.hasMatch(str.toLowerCase());
    }

    if (email == null || email.isEmpty) {
      return "Email em branco";
    } else if (validarEmail(email)) {
      return null;
    } else {
      return "Email inválido";
    }
  }

  static String validateCVV(String value) {
    if (value.isEmpty) {
      return "CVV em branco";
    }

    if (value.length < 3 || value.length > 4) {
      return "CVV inválido";
    }
    return null;
  }

  static String validateDate(String value) {
    if (value == null || value.isEmpty) {
      return "Formato dd/aaaa";
    }

    int year;
    int month;
    // The value contains a forward slash if the month and year has been
    // entered.
    if (value.contains(new RegExp(r'(\/)'))) {
      var split = value.split(new RegExp(r'(\/)'));
      if (split.length < 2) return "Formato: dd/aaaa";
      // The value before the slash is the month while the value to right of
      // it is the year.
      month = int.parse(split[0].isNotEmpty ? split[0] : '0');
      year = int.parse(split[1].isNotEmpty ? split[1] : '0');
    } else {
      // Only the month was entered
      month = int.parse(value.substring(0, (value.length)));
      year = -1; // Lets use an invalid year intentionally
    }

    if ((month < 1) || (month > 12)) {
      // A valid month is between 1 (January) and 12 (December)
      return 'Mês inválido';
    }

    // var fourDigitsYear = convertYearTo4Digits(year);
    if (year < DateTime.now().year || year > 2099) {
      return 'Ano inválido';
    }

    if (!hasDateExpired(month, year)) {
      return "Cartão expirado";
    }
    return null;
  }

  static bool hasDateExpired(int month, int year) {
    return !(month == null || year == null) && isNotExpired(year, month);
  }

  static bool isNotExpired(int year, int month) {
    // It has not expired if both the year and date has not passed
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();
    // The month has passed if:
    // 1. The year is in the past. In that case, we just assume that the month
    // has passed
    // 2. Card's month (plus another month) is less than current month.
    return hasYearPassed(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();
    // The year has passed if the year we are currently, is greater than card's
    // year
    return fourDigitsYear < now.year;
  }

  static String creditCard(String value) {
    if (value == null || value.isEmpty) return 'Número em branco';
    value = value.replaceAll(' ', '');

    if (value.length < 8) {
      // No need to even proceed with the validation if it's less than 8 characters
      return 'Número inválido';
    }

    int sum = 0;
    int length = value.length;
    for (var i = 0; i < length; i++) {
      // get digits in reverse order
      int digit = int.parse(value[length - i - 1]);

      // every 2nd number multiply with 2
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }

    if (sum % 10 == 0) {
      return null;
    }

    return 'Número inválido';
  }

  static String maxCaracteres(String value) {
    if (value == null || value.isEmpty) {
      return "Campo em branco";
    } else if (value.length > 300)
      return "Quantidade de caractere máxima é 300";
    return null;
  }

  static String password(String password) {
    if (password == null || password.isEmpty) {
      return "Senha em branco";
    }

    if (password.length < 6) {
      return "Mínimo 6 caracteres";
    }

    // final strength = estimatePasswordStrength(password);
    // if (strength < 0.3) {
    //   return "Senha fraca, tente uma mais forte".i18n;
    // } else {
    //   return null;
    // }

    return null;
  }

  static String repeatPassword(String password, String repeatPassword) {
    if (password != repeatPassword) {
      return "Senhas diferentes";
    }
    return null;
  }

  static String yearNotEmptyValid(String year) {
    if (year == null || year.isEmpty) {
      return "O ano não pode ser vazio.";
    }

    var now = DateTime.now();
    if (int.parse(year) < 1800) {
      return 'Ano inválido.';
    }
    if (int.parse(year) > now.year + 1) {
      return 'Ano não pode ter 2 anos a mais que o atual.';
    }

    return null;
  }
}
