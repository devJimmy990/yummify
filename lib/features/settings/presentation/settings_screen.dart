import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummify/core/localization/localization.dart';
import 'package:yummify/features/settings/cubit/settings_cubit.dart';
import 'package:yummify/features/settings/cubit/settings_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(Localization.profileSettings)),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final cubit = context.read<SettingsCubit>();
          final isDark = state.isDarkMode;
          final isArabic = state.locale == "ar";

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Theme Switch
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SwitchListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  title: Text(
                    'Theme: ${isDark ? Localization.themeDark : Localization.themeLight}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  secondary: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
                  value: isDark,
                  onChanged: (_) => cubit.toggleTheme(),
                ),
              ),
              const SizedBox(height: 16),

              // Language Switch
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: const Icon(Icons.language),
                  title: Text(
                    'Language: ${isArabic ? Localization.localeArabic : Localization.localeEnglish}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: ElevatedButton.icon(
                    onPressed: () => cubit.toggleLocale(),
                    icon: const Icon(Icons.translate),
                    label: const Text("Switch"),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      textStyle: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}
