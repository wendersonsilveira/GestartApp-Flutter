import 'package:string_validator/string_validator.dart';
import 'package:cpfcnpj/cpfcnpj.dart';

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

  static String maxCaracteres(String value) {
    if (value == null || value.isEmpty) {
      return "Campo em branco";
    } else if (value.length > 150)
      return "Quantidade de caractere máxima é 150";
    return null;
  }

  static String teste01(int um, int dois) {
    if (um > dois)
      return "valor menor";
    else
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

    if (CPF.isValid(value)) {
      return null;
    } else if (CNPJ.isValid(value)) {
      return null;
    } else {
      return "CPF ou CNPJ inválido";
    }
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
    if (email == null || email.isEmpty) {
      return "Email em branco";
    } else if (isEmail(email)) {
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
}
