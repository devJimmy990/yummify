import 'package:yummify/core/localization/generated/l10n.dart';

class Localization {
  static String get themeDark => S.current.theme_dark;
  static String get themeLight => S.current.theme_light;
  static String get localeEnglish => S.current.language_english;
  static String get localeArabic => S.current.language_arabic;
  static String get noConnection => S.current.no_connection;

  //-------------------- Inputs Validator --------------------------------
  static String get validatorEmpty => S.current.validator_empty;
  static String get validatorLongName => S.current.validator_long_name;
  static String get validatorShortName => S.current.validator_short_name;
  static String get validatorInvalidPhone => S.current.validator_invalid_phone;
  static String get validatorInvalidEmail => S.current.validator_invalid_email;
  static String get validatorShortMessage => S.current.validator_short_message;
  static String get validatorShortPassword =>
      S.current.validator_short_password;
  static String get validatorPasswordNotMatch =>
      S.current.validator_password_not_match;

  // static String get validatorNetworkUsedEmail =>
  //     S.current.validator_network_used_email;
  // static String get validatorNetworkWeakPassword =>
  //     S.current.validator_network_weak_password;
  // static String get validatorNetworkInvalidCredentials =>
  //     S.current.validator_network_invalid_credentials;
  //---------------------------------------------------------------------- //-------------------- Auth  -----------------------------------------
  static String get authAccountCreatedSuccessfully =>
      S.current.auth_account_created_successfully;
  static String get authAlreadyHaveAnAccount =>
      S.current.auth_already_have_an_account;
  static String get authAuthenticationRequired =>
      S.current.auth_authentication_required;
  static String get authConfirmPassword => S.current.auth_confirm_password;
  static String get authNoAccount => S.current.auth_no_account;
  static String get authEmail => S.current.auth_email;
  static String get authEnterYourEmail => S.current.auth_enter_your_email;
  static String get authEnterYourFullName =>
      S.current.auth_enter_your_full_name;
  static String get authEnterYourPassword => S.current.auth_enter_your_password;
  static String get authEnterYourPhoneNumber =>
      S.current.auth_enter_your_phone_number;
  static String get authFullName => S.current.auth_full_name;
  static String get authInvalidEmailOrPassword =>
      S.current.auth_invalid_email_or_password;
  static String get authLogIn => S.current.auth_log_in;
  static String get authLogin => S.current.auth_login;
  static String get authPassword => S.current.auth_password;
  static String get authPhoneNumber => S.current.auth_phone_number;
  static String get authPleaseLogInToContinueWithCheckout =>
      S.current.auth_please_log_in_to_continue_with_checkout;
  static String get authSignUp => S.current.auth_sign_up;
  //---------------------------------------------------------------------

  //-------------------- Cart  -----------------------------------------
  static String get cartMyCart => S.current.cart_my_cart;
  static String get cartOrderCreatedSuccessfully =>
      S.current.cart_order_created_successfully;
  static String get cartProceedToCheckout => S.current.cart_proceed_to_checkout;
  static String get cartYourCartIsEmpty => S.current.cart_your_cart_is_empty;
  //---------------------------------------------------------------------

  //-------------------- General  -----------------------------------------
  static String get generalCancel => S.current.general_cancel;
  static String get generalClear => S.current.general_clear;
  static String get generalConfirm => S.current.general_confirm;
  static String get generalError => S.current.general_error;
  static String get generalOk => S.current.general_ok;
  // static String get generalTotal => S.current.general_total;
  //---------------------------------------------------------------------

  //-------------------- Main  -----------------------------------------
  static String get mainCart => S.current.main_cart;
  static String get mainHome => S.current.main_home;
  static String get mainProfile => S.current.main_profile;
  //---------------------------------------------------------------------

  //-------------------- Order  -----------------------------------------
  // static String get orderItems => S.current.order_items;
  static String get orderMarkAsComplete => S.current.order_mark_as_complete;
  static String get orderOrder => S.current.order_order;
  static String get orderOrderDate => S.current.order_order_date;
  static String get orderOrderItems => S.current.order_order_items;
  static String get orderStatus => S.current.order_status;
  static String get orderTotalItems => S.current.order_total_items;
  static String get orderTotalPrice => S.current.order_total_price;
  //---------------------------------------------------------------------

  //-------------------- Profile  -----------------------------------------
  static String get profileContactUs => S.current.profile_contact_us;
  static String get profileContinueShopping =>
      S.current.profile_continue_shopping;
  static String get profileEditProfile => S.current.profile_edit_profile;
  static String get profileFaq => S.current.profile_faq;
  static String get profileLogInToViewYourProfileOrdersAndCart =>
      S.current.profile_log_in_to_view_your_profile_orders_and_cart;
  static String get profileLogOut => S.current.profile_log_out;
  static String get profileMyOrders => S.current.profile_my_orders;
  static String get profileSettings => S.current.profile_settings;
  static String get profileWelcomeGuest => S.current.profile_welcome_guest;
  //---------------------------------------------------------------------

  //-------------------- Settings  -----------------------------------------
  static String get settingsLanguage => S.current.settings_language;
  static String get settingsSettings => S.current.settings_settings;
  static String get settingsSwitch => S.current.settings_switch;
  // static String get settingsTheme => S.current.settings_theme;
  //---------------------------------------------------------------------

  //-------------------- Shopping  -----------------------------------------
  static String get shoppingPopularMeals => S.current.shopping_popular_meals;
  static String get shoppingAddToCart => S.current.shopping_add_to_cart;
  static String get shoppingAllMeals => S.current.shopping_all_meals;
  static String get shoppingFailedToLoadCategories =>
      S.current.shopping_failed_to_load_categories;
  static String get shoppingItemAddedToCart =>
      S.current.shopping_item_added_to_cart;
  static String get shoppingSeeAll => S.current.shopping_see_all;
  //---------------------------------------------------------------------
}
