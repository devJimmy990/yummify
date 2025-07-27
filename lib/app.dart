import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yummify/core/helper/service_locator.dart';
import 'package:yummify/core/localization/generated/l10n.dart';
import 'package:yummify/core/routes/router.dart';
import 'package:yummify/core/routes/routes.dart';
import 'package:yummify/core/theme/app_theme.dart';
import 'package:yummify/features/auth/cubit/auth_cubit.dart';
import 'package:yummify/features/cart/cubit/cart_cubit.dart';
import 'package:yummify/features/connection/model/connection.dart';
import 'package:yummify/features/connection/screen/connection_screen.dart';
import 'package:yummify/features/order/cubit/order_cubit.dart';
import 'package:yummify/features/settings/cubit/settings_cubit.dart';
import 'package:yummify/features/settings/cubit/settings_state.dart';
import 'package:yummify/features/shopping/cubit/category/category_cubit.dart';
import 'package:yummify/features/shopping/cubit/meal/meal_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
    builder:
        (context, _) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<AuthCubit>()),
            BlocProvider(create: (_) => sl<MealCubit>()),
            BlocProvider(create: (_) => sl<CartCubit>()),
            BlocProvider(create: (_) => sl<OrderCubit>()),
            BlocProvider(create: (_) => sl<CategoryCubit>()),
            BlocProvider(create: (_) => sl<SettingsCubit>()),
          ],
          child: StreamBuilder<bool>(
            stream: ConnectionService.instance.connectionStream,
            initialData: true,
            builder: (context, snapshot) {
              final isConnected = snapshot.data ?? false;

              if (!isConnected) {
                return const NoConnectionScreen();
              }

              return BlocBuilder<SettingsCubit, SettingsState>(
                builder:
                    (context, settingsState) => MaterialApp(
                      key: Key(settingsState.locale),
                      debugShowCheckedModeBanner: false,
                      locale: Locale(settingsState.locale),
                      supportedLocales: S.delegate.supportedLocales,
                      localizationsDelegates: const [
                        S.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      theme:
                          settingsState.isDarkMode
                              ? AppTheme.dark
                              : AppTheme.light,
                      routes: appRoutes,
                      initialRoute: Routes.main,
                    ),
              );
            },
          ),
        ),
  );
}
