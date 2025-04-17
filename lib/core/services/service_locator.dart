import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:grocery/src/features/auth/signup/data/datasource/signup_api_service.dart';
import 'package:grocery/src/features/auth/signup/data/datasource/signup_remote_ds.dart';
import 'package:grocery/src/features/auth/signup/domain/repository/signup_repo.dart';
import 'package:grocery/src/features/auth/signup/domain/usecase/sign_up_use_case.dart';
import 'package:grocery/src/features/auth/signup/presentation/cubit/sign_up_cubit.dart';
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

  getIt.registerLazySingleton<SignUpApiService>(
    () => SignUpApiService(getIt<ApiConsumer>()),
  );

  ///! --DataSources-- ///
  getIt.registerLazySingleton<SginUpRemoteDS>(
    () => SginUpRemoteDS(getIt<SignUpApiService>()),
  );

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
