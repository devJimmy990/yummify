import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  const SettingsState({required this.theme, required this.locale});

  factory SettingsState.initial() =>
      const SettingsState(theme: 'light', locale: 'en');

  factory SettingsState.fromMap(Map<String, dynamic> map) => SettingsState(
    theme: map['theme'] as String? ?? 'light',
    locale: map['locale'] as String? ?? 'en',
  );

  final String theme;
  final String locale;

  SettingsState copyWith({String? theme, String? locale}) =>
      SettingsState(theme: theme ?? this.theme, locale: locale ?? this.locale);

  Map<String, dynamic> toMap() => {'theme': theme, 'locale': locale};

  bool get isDarkMode => theme == 'dark';
  String get currentLocale => locale;
  @override
  List<Object?> get props => [theme, locale];
}
