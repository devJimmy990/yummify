// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

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
    final name = (locale.countryCode?.isEmpty ?? false)
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

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Dark`
  String get theme_dark {
    return Intl.message('Dark', name: 'theme_dark', desc: '', args: []);
  }

  /// `Light`
  String get theme_light {
    return Intl.message('Light', name: 'theme_light', desc: '', args: []);
  }

  /// `Arabic`
  String get language_arabic {
    return Intl.message('Arabic', name: 'language_arabic', desc: '', args: []);
  }

  /// `English`
  String get language_english {
    return Intl.message(
      'English',
      name: 'language_english',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get no_connection {
    return Intl.message(
      'No Internet Connection',
      name: 'no_connection',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get validator_empty {
    return Intl.message(
      'This field is required',
      name: 'validator_empty',
      desc: '',
      args: [],
    );
  }

  /// `Name is too long`
  String get validator_long_name {
    return Intl.message(
      'Name is too long',
      name: 'validator_long_name',
      desc: '',
      args: [],
    );
  }

  /// `Name is too short`
  String get validator_short_name {
    return Intl.message(
      'Name is too short',
      name: 'validator_short_name',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get validator_invalid_phone {
    return Intl.message(
      'Invalid phone number',
      name: 'validator_invalid_phone',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address`
  String get validator_invalid_email {
    return Intl.message(
      'Invalid email address',
      name: 'validator_invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Message is too short`
  String get validator_short_message {
    return Intl.message(
      'Message is too short',
      name: 'validator_short_message',
      desc: '',
      args: [],
    );
  }

  /// `Password is too short`
  String get validator_short_password {
    return Intl.message(
      'Password is too short',
      name: 'validator_short_password',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get validator_password_not_match {
    return Intl.message(
      'Passwords do not match',
      name: 'validator_password_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Account created successfully`
  String get auth_account_created_successfully {
    return Intl.message(
      'Account created successfully',
      name: 'auth_account_created_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get auth_already_have_an_account {
    return Intl.message(
      'Already have an account?',
      name: 'auth_already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Authentication Required`
  String get auth_authentication_required {
    return Intl.message(
      'Authentication Required',
      name: 'auth_authentication_required',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get auth_confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'auth_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get auth_no_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'auth_no_account',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get auth_email {
    return Intl.message('Email', name: 'auth_email', desc: '', args: []);
  }

  /// `Enter your email`
  String get auth_enter_your_email {
    return Intl.message(
      'Enter your email',
      name: 'auth_enter_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your full name`
  String get auth_enter_your_full_name {
    return Intl.message(
      'Enter your full name',
      name: 'auth_enter_your_full_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get auth_enter_your_password {
    return Intl.message(
      'Enter your password',
      name: 'auth_enter_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get auth_enter_your_phone_number {
    return Intl.message(
      'Enter your phone number',
      name: 'auth_enter_your_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get auth_full_name {
    return Intl.message(
      'Full Name',
      name: 'auth_full_name',
      desc: '',
      args: [],
    );
  }

  /// `invalid email or password`
  String get auth_invalid_email_or_password {
    return Intl.message(
      'invalid email or password',
      name: 'auth_invalid_email_or_password',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get auth_log_in {
    return Intl.message('Log In', name: 'auth_log_in', desc: '', args: []);
  }

  /// `Login`
  String get auth_login {
    return Intl.message('Login', name: 'auth_login', desc: '', args: []);
  }

  /// `Password`
  String get auth_password {
    return Intl.message('Password', name: 'auth_password', desc: '', args: []);
  }

  /// `Phone Number`
  String get auth_phone_number {
    return Intl.message(
      'Phone Number',
      name: 'auth_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Please log in to continue with checkout.`
  String get auth_please_log_in_to_continue_with_checkout {
    return Intl.message(
      'Please log in to continue with checkout.',
      name: 'auth_please_log_in_to_continue_with_checkout',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get auth_sign_up {
    return Intl.message('Sign Up', name: 'auth_sign_up', desc: '', args: []);
  }

  /// `My Cart`
  String get cart_my_cart {
    return Intl.message('My Cart', name: 'cart_my_cart', desc: '', args: []);
  }

  /// `Order created successfully!`
  String get cart_order_created_successfully {
    return Intl.message(
      'Order created successfully!',
      name: 'cart_order_created_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Proceed to Checkout`
  String get cart_proceed_to_checkout {
    return Intl.message(
      'Proceed to Checkout',
      name: 'cart_proceed_to_checkout',
      desc: '',
      args: [],
    );
  }

  /// `Your cart is empty.`
  String get cart_your_cart_is_empty {
    return Intl.message(
      'Your cart is empty.',
      name: 'cart_your_cart_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get general_cancel {
    return Intl.message('Cancel', name: 'general_cancel', desc: '', args: []);
  }

  /// `clear`
  String get general_clear {
    return Intl.message('clear', name: 'general_clear', desc: '', args: []);
  }

  /// `Confirm`
  String get general_confirm {
    return Intl.message('Confirm', name: 'general_confirm', desc: '', args: []);
  }

  /// `Error`
  String get general_error {
    return Intl.message('Error', name: 'general_error', desc: '', args: []);
  }

  /// `Ok`
  String get general_ok {
    return Intl.message('Ok', name: 'general_ok', desc: '', args: []);
  }

  /// `Total: `
  String get general_total_ {
    return Intl.message('Total: ', name: 'general_total_', desc: '', args: []);
  }

  /// `Cart`
  String get main_cart {
    return Intl.message('Cart', name: 'main_cart', desc: '', args: []);
  }

  /// `Home`
  String get main_home {
    return Intl.message('Home', name: 'main_home', desc: '', args: []);
  }

  /// `Profile`
  String get main_profile {
    return Intl.message('Profile', name: 'main_profile', desc: '', args: []);
  }

  /// `items •`
  String get order_items_ {
    return Intl.message('items •', name: 'order_items_', desc: '', args: []);
  }

  /// `Mark as Complete`
  String get order_mark_as_complete {
    return Intl.message(
      'Mark as Complete',
      name: 'order_mark_as_complete',
      desc: '',
      args: [],
    );
  }

  /// `Order # `
  String get order_order {
    return Intl.message('Order # ', name: 'order_order', desc: '', args: []);
  }

  /// `Order Date`
  String get order_order_date {
    return Intl.message(
      'Order Date',
      name: 'order_order_date',
      desc: '',
      args: [],
    );
  }

  /// `Order Items`
  String get order_order_items {
    return Intl.message(
      'Order Items',
      name: 'order_order_items',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get order_status {
    return Intl.message('Status', name: 'order_status', desc: '', args: []);
  }

  /// `Total Items`
  String get order_total_items {
    return Intl.message(
      'Total Items',
      name: 'order_total_items',
      desc: '',
      args: [],
    );
  }

  /// `Total Price`
  String get order_total_price {
    return Intl.message(
      'Total Price',
      name: 'order_total_price',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get profile_contact_us {
    return Intl.message(
      'Contact Us',
      name: 'profile_contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Continue Shopping`
  String get profile_continue_shopping {
    return Intl.message(
      'Continue Shopping',
      name: 'profile_continue_shopping',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get profile_edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'profile_edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `FAQ`
  String get profile_faq {
    return Intl.message('FAQ', name: 'profile_faq', desc: '', args: []);
  }

  /// `Log in to view your profile, orders, and cart.`
  String get profile_log_in_to_view_your_profile_orders_and_cart {
    return Intl.message(
      'Log in to view your profile, orders, and cart.',
      name: 'profile_log_in_to_view_your_profile_orders_and_cart',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get profile_log_out {
    return Intl.message('Log Out', name: 'profile_log_out', desc: '', args: []);
  }

  /// `My Orders`
  String get profile_my_orders {
    return Intl.message(
      'My Orders',
      name: 'profile_my_orders',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get profile_settings {
    return Intl.message(
      'Settings',
      name: 'profile_settings',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Guest!`
  String get profile_welcome_guest {
    return Intl.message(
      'Welcome Guest!',
      name: 'profile_welcome_guest',
      desc: '',
      args: [],
    );
  }

  /// `Language:`
  String get settings_language {
    return Intl.message(
      'Language:',
      name: 'settings_language',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings_settings {
    return Intl.message(
      'Settings',
      name: 'settings_settings',
      desc: '',
      args: [],
    );
  }

  /// `Switch`
  String get settings_switch {
    return Intl.message('Switch', name: 'settings_switch', desc: '', args: []);
  }

  /// `Theme: `
  String get settings_theme_ {
    return Intl.message('Theme: ', name: 'settings_theme_', desc: '', args: []);
  }

  /// `🍽️ Popular Meals`
  String get shopping_popular_meals {
    return Intl.message(
      '🍽️ Popular Meals',
      name: 'shopping_popular_meals',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get shopping_add_to_cart {
    return Intl.message(
      'Add to Cart',
      name: 'shopping_add_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `All Meals`
  String get shopping_all_meals {
    return Intl.message(
      'All Meals',
      name: 'shopping_all_meals',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load categories`
  String get shopping_failed_to_load_categories {
    return Intl.message(
      'Failed to load categories',
      name: 'shopping_failed_to_load_categories',
      desc: '',
      args: [],
    );
  }

  /// `Item added to cart`
  String get shopping_item_added_to_cart {
    return Intl.message(
      'Item added to cart',
      name: 'shopping_item_added_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get shopping_see_all {
    return Intl.message(
      'See All',
      name: 'shopping_see_all',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

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
