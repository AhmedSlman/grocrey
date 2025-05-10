import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/app_cubit/app_cubit.dart';
import 'package:grocery/core/data/cached/cache_helper.dart';

import 'package:grocery/core/routes/app_routers.dart';
import 'package:grocery/core/services/service_locator.dart';
import 'package:grocery/core/theme/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setupLocator();
  CacheHelper().init();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      startLocale: Locale('ar'),
      path: 'assets/lang',
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (BuildContext context) => AppCubit(),
          child: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              return MaterialApp.router(
                routerConfig: router,

                debugShowCheckedModeBanner: false,
                theme: AppTheme.getTheme(state.themeEnum),
                localizationsDelegates: context.localizationDelegates,
                locale: context.locale,
                supportedLocales: context.supportedLocales,

                //    localizationsDelegates:context.localizationDelegates ,
              );
            },
          ),
        );
      },
    );
  }
}
