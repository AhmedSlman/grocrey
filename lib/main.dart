import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/app_cubit/app_cubit.dart';
import 'package:grocery/core/data/cached/cache_helper.dart';
import 'package:grocery/core/routes/app_routers.dart';
import 'package:grocery/core/services/service_locator.dart';
import 'package:grocery/core/theme/app_themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => AppCubit(),
          child: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              return MaterialApp.router(
                routerConfig: router,
                debugShowCheckedModeBanner: false,
                theme: AppTheme.getTheme(state.themeEnum),
                locale: const Locale('ar'),
                supportedLocales: const [Locale('en'), Locale('ar')],
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
              );
            },
          ),
        );
      },
    );
  }
}
