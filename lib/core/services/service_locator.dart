import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../app_cubit/app_cubit.dart';
import '../data/api/api_consumer.dart';
import '../data/api/dio_consumer.dart';
import '../data/cached/cache_helper.dart';

final GetIt getIt = GetIt.instance;
void setupLocator() {
  ///! FOR APP CUBIT ///
  getIt.registerFactory<AppCubit>(() => AppCubit());

  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(dio: getIt<Dio>()),
  );

  //!Api Services //

  ///! --DataSources-- ///

  /// !-- Repositories -- ///
  getIt.registerLazySingleton<RegisterRepository>(
    () => RegisterRepositoryImpl(getIt<SginUpRemoteDS>()),
  );

  /// !-- UseCases -- ///

  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<RegisterRepository>()),
  );
  // !Cubits //
  getIt.registerFactory<SignUpCubit>(
    () => SignUpCubit(getIt<RegisterUseCase>()),
  );
}
