import 'package:yummify/core/localization/localization.dart';

class AuthValidator {
  static String signIn(String value) {
    if (value.contains("invalid_credentials") ||
        value.contains("email_not_confirmed")) {
      return Localization.authInvalidEmailOrPassword;
    }
    return value;
  }
}
