// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "auth_btn_forget_password": MessageLookupByLibrary.simpleMessage(
      "Forget Password?",
    ),
    "auth_btn_logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "auth_btn_sign_in": MessageLookupByLibrary.simpleMessage("Sign in"),
    "auth_btn_sign_in_google": MessageLookupByLibrary.simpleMessage(
      "Sign in With Google",
    ),
    "auth_btn_sign_up": MessageLookupByLibrary.simpleMessage("Sign up"),
    "auth_input_confirm_password": MessageLookupByLibrary.simpleMessage(
      "Confirm Password",
    ),
    "auth_input_email": MessageLookupByLibrary.simpleMessage("E-Mail"),
    "auth_input_full_name": MessageLookupByLibrary.simpleMessage("Full Name"),
    "auth_input_password": MessageLookupByLibrary.simpleMessage("Password"),
    "auth_input_phone": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "auth_remember_msg": MessageLookupByLibrary.simpleMessage(
      "need to login every time open the app",
    ),
    "auth_tab_sign_in": MessageLookupByLibrary.simpleMessage("Sign in"),
    "auth_tab_sign_up": MessageLookupByLibrary.simpleMessage("Sign up"),
    "auth_toggle_remember_me": MessageLookupByLibrary.simpleMessage(
      "Remember Me",
    ),
    "language_arabic": MessageLookupByLibrary.simpleMessage("Arabic"),
    "language_english": MessageLookupByLibrary.simpleMessage("English"),
    "language_switch": MessageLookupByLibrary.simpleMessage(
      "تغيير للغة العربية",
    ),
    "theme_dark": MessageLookupByLibrary.simpleMessage("Dark"),
    "theme_light": MessageLookupByLibrary.simpleMessage("Light"),
    "theme_switch": MessageLookupByLibrary.simpleMessage("Switch"),
    "validator_empty": MessageLookupByLibrary.simpleMessage("required"),
    "validator_firebase_invalid_credentials":
        MessageLookupByLibrary.simpleMessage("invalid email or password"),
    "validator_firebase_used_email": MessageLookupByLibrary.simpleMessage(
      "The account already exists for that email",
    ),
    "validator_firebase_weak_password": MessageLookupByLibrary.simpleMessage(
      "password is too weak",
    ),
    "validator_invalid_email": MessageLookupByLibrary.simpleMessage(
      "invalid email format e.g. abc@email.com",
    ),
    "validator_invalid_phone": MessageLookupByLibrary.simpleMessage(
      "invalid phone number format e.g. 0128223643",
    ),
    "validator_long_name": MessageLookupByLibrary.simpleMessage(
      "Name must be less than 25 characters",
    ),
    "validator_password_not_match": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "validator_short_message": MessageLookupByLibrary.simpleMessage(
      "Name is too short",
    ),
    "validator_short_name": MessageLookupByLibrary.simpleMessage(
      "Name is too short",
    ),
    "validator_short_password": MessageLookupByLibrary.simpleMessage(
      "Password must be more than 6 characters",
    ),
  };
}
