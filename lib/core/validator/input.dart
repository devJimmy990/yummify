import 'package:yummify/core/localization/localization.dart';
import 'package:yummify/core/validator/regex.dart';

class InputValidator {
  static String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return Localization.validatorEmpty;
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return Localization.validatorEmpty;
    } else if (value.length < 3) {
      return Localization.validatorShortName;
    } else if (value.length > 25) {
      return Localization.validatorLongName;
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return Localization.validatorEmpty;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return Localization.validatorEmpty;
    } else if (!Regex.matchEmail(value)) {
      return Localization.validatorInvalidEmail;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return Localization.validatorEmpty;
    } else if (value.length < 6) {
      return Localization.validatorShortPassword;
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return Localization.validatorEmpty;
    } else if (value != password) {
      return Localization.validatorPasswordNotMatch;
    }
    return null;
  }
}
