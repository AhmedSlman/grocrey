import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:grocery/src/features/profile/data/data_source/profile_data_source.dart';
import 'package:grocery/src/features/profile/data/repositories/profile_repo_impl.dart';
import 'package:grocery/src/features/profile/domain/usecases/change_password_use_case.dart';
import 'package:grocery/src/features/profile/domain/usecases/edit_profile_use_case.dart';
import 'package:grocery/src/features/profile/domain/usecases/get_profile_use_cases.dart';
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
  getIt.registerLazySingleton<ProfileDataSourceImpl>(
    () => ProfileDataSourceImpl(getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<ProfileRepoImpl>(
    () => ProfileRepoImpl(getIt<ProfileDataSourceImpl>()),
  );

  ///! --DataSources-- ///
  getIt.registerLazySingleton<GetProfileUseCases>(
    () => GetProfileUseCases(getIt<ProfileRepoImpl>()),
  );

  getIt.registerLazySingleton<UpdateProfileUseCases>(
    () => UpdateProfileUseCases(getIt<ProfileRepoImpl>()),
  );

  getIt.registerLazySingleton<ChangePasswordUseCase>(
    () => ChangePasswordUseCase(getIt<ProfileRepoImpl>()),
  );

  /// !-- Repositories -- ///
  /// !-- UseCases -- ///

  // !Cubits //
}
