import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yummify/core/helper/service_locator.dart';
import 'package:yummify/core/localization/generated/l10n.dart';
import 'package:yummify/core/routes/router.dart';
import 'package:yummify/core/routes/routes.dart';
import 'package:yummify/features/auth/cubit/auth_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
    builder:
        (context, child) => MultiBlocProvider(
          providers: [BlocProvider(create: (_) => sl<AuthCubit>())],
          child: MaterialApp(
            routes: appRoutes,
            initialRoute: Routes.login,
            debugShowCheckedModeBanner: false,
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          ),
        ),
  );
}
