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

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }

    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }

    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone is required';
    }

    final phoneRegex = RegExp(r'^\+?[0-9]{10,}$');

    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }

    return null;
  }
}
