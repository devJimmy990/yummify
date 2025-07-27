import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:yummify/features/settings/cubit/settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit() : super(SettingsState.initial());

  void toggleTheme() {
    final newTheme = state.theme == 'dark' ? 'light' : 'dark';
    emit(state.copyWith(theme: newTheme));
  }

  void toggleLocale() {
    final newLocale = state.locale == 'en' ? 'ar' : 'en';
    emit(state.copyWith(locale: newLocale));
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    try {
      return SettingsState.fromMap(json);
    } catch (_) {
      return SettingsState.initial();
    }
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) => state.toMap();
}
