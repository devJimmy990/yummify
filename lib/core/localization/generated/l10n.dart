// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yummify/core/localization/generated/intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) => Localizations.of<S>(context, S);

  /// `Switch`
  String get theme_switch =>
      Intl.message('Switch', name: 'theme_switch', desc: '', args: []);

  /// `Dark`
  String get theme_dark =>
      Intl.message('Dark', name: 'theme_dark', desc: '', args: []);

  /// `Light`
  String get theme_light =>
      Intl.message('Light', name: 'theme_light', desc: '', args: []);

  /// `Arabic`
  String get language_arabic =>
      Intl.message('Arabic', name: 'language_arabic', desc: '', args: []);

  /// `English`
  String get language_english =>
      Intl.message('English', name: 'language_english', desc: '', args: []);

  /// `تغيير للغة العربية`
  String get language_switch => Intl.message(
    'تغيير للغة العربية',
    name: 'language_switch',
    desc: '',
    args: [],
  );

  /// `required`
  String get validator_empty =>
      Intl.message('required', name: 'validator_empty', desc: '', args: []);

  /// `Name is too short`
  String get validator_short_message => Intl.message(
    'Name is too short',
    name: 'validator_short_message',
    desc: '',
    args: [],
  );

  /// `Name is too short`
  String get validator_short_name => Intl.message(
    'Name is too short',
    name: 'validator_short_name',
    desc: '',
    args: [],
  );

  /// `Name must be less than 25 characters`
  String get validator_long_name => Intl.message(
    'Name must be less than 25 characters',
    name: 'validator_long_name',
    desc: '',
    args: [],
  );

  /// `invalid phone number format e.g. 0128223643`
  String get validator_invalid_phone => Intl.message(
    'invalid phone number format e.g. 0128223643',
    name: 'validator_invalid_phone',
    desc: '',
    args: [],
  );

  /// `invalid email format e.g. abc@email.com`
  String get validator_invalid_email => Intl.message(
    'invalid email format e.g. abc@email.com',
    name: 'validator_invalid_email',
    desc: '',
    args: [],
  );

  /// `Password must be more than 6 characters`
  String get validator_short_password => Intl.message(
    'Password must be more than 6 characters',
    name: 'validator_short_password',
    desc: '',
    args: [],
  );

  /// `Passwords do not match`
  String get validator_password_not_match => Intl.message(
    'Passwords do not match',
    name: 'validator_password_not_match',
    desc: '',
    args: [],
  );

  /// `invalid email or password`
  String get validator_firebase_invalid_credentials => Intl.message(
    'invalid email or password',
    name: 'validator_firebase_invalid_credentials',
    desc: '',
    args: [],
  );

  /// `password is too weak`
  String get validator_firebase_weak_password => Intl.message(
    'password is too weak',
    name: 'validator_firebase_weak_password',
    desc: '',
    args: [],
  );

  /// `The account already exists for that email`
  String get validator_firebase_used_email => Intl.message(
    'The account already exists for that email',
    name: 'validator_firebase_used_email',
    desc: '',
    args: [],
  );

  /// `E-Mail`
  String get auth_input_email =>
      Intl.message('E-Mail', name: 'auth_input_email', desc: '', args: []);

  /// `Phone Number`
  String get auth_input_phone => Intl.message(
    'Phone Number',
    name: 'auth_input_phone',
    desc: '',
    args: [],
  );

  /// `Password`
  String get auth_input_password =>
      Intl.message('Password', name: 'auth_input_password', desc: '', args: []);

  /// `Full Name`
  String get auth_input_full_name => Intl.message(
    'Full Name',
    name: 'auth_input_full_name',
    desc: '',
    args: [],
  );

  /// `Confirm Password`
  String get auth_input_confirm_password => Intl.message(
    'Confirm Password',
    name: 'auth_input_confirm_password',
    desc: '',
    args: [],
  );

  /// `Sign in`
  String get auth_btn_sign_in =>
      Intl.message('Sign in', name: 'auth_btn_sign_in', desc: '', args: []);

  /// `Sign up`
  String get auth_btn_sign_up =>
      Intl.message('Sign up', name: 'auth_btn_sign_up', desc: '', args: []);

  /// `Logout`
  String get auth_btn_logout =>
      Intl.message('Logout', name: 'auth_btn_logout', desc: '', args: []);

  /// `Forget Password?`
  String get auth_btn_forget_password => Intl.message(
    'Forget Password?',
    name: 'auth_btn_forget_password',
    desc: '',
    args: [],
  );

  /// `Sign in With Google`
  String get auth_btn_sign_in_google => Intl.message(
    'Sign in With Google',
    name: 'auth_btn_sign_in_google',
    desc: '',
    args: [],
  );

  /// `Sign in`
  String get auth_tab_sign_in =>
      Intl.message('Sign in', name: 'auth_tab_sign_in', desc: '', args: []);

  /// `Sign up`
  String get auth_tab_sign_up =>
      Intl.message('Sign up', name: 'auth_tab_sign_up', desc: '', args: []);

  /// `Remember Me`
  String get auth_toggle_remember_me => Intl.message(
    'Remember Me',
    name: 'auth_toggle_remember_me',
    desc: '',
    args: [],
  );

  /// `need to login every time open the app`
  String get auth_remember_msg => Intl.message(
    'need to login every time open the app',
    name: 'auth_remember_msg',
    desc: '',
    args: [],
  );
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales => const <Locale>[
    Locale.fromSubtags(languageCode: 'en'),
    Locale.fromSubtags(languageCode: 'ar'),
  ];

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
