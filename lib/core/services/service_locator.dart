import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:grocery/src/features/auth/forgotPassword/data/datasource/forgot_passsword_api_service.dart';
import 'package:grocery/src/features/auth/forgotPassword/data/datasource/forgotpassword_remote_ds.dart';
import 'package:grocery/src/features/auth/forgotPassword/domain/repos/forgot_password_repo.dart';
import 'package:grocery/src/features/auth/forgotPassword/presentation/cubit/forgot_passworrd_cubit.dart';
import 'package:grocery/src/features/auth/login/data/datasource/login_api_service.dart';
import 'package:grocery/src/features/auth/login/data/datasource/login_remote_ds.dart'
    show LoginRemoteDs;
import 'package:grocery/src/features/auth/login/doamin/repos/login_repository.dart';
import 'package:grocery/src/features/auth/login/doamin/usecase/login_use_case.dart';
import 'package:grocery/src/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:grocery/src/features/auth/otpFormForPassword/data/datasource/verify_code_api_service.dart';
import 'package:grocery/src/features/auth/otpFormForPassword/data/datasource/vierify_code_remote_ds.dart';
import 'package:grocery/src/features/auth/otpFormForPassword/doamin/repos/verify_code_repo.dart';
import 'package:grocery/src/features/auth/otpFormForPassword/presentation/cubit/verify_code_cubit.dart';
import 'package:grocery/src/features/auth/signup/data/datasource/signup_api_service.dart';
import 'package:grocery/src/features/auth/signup/data/datasource/signup_remote_ds.dart';
import 'package:grocery/src/features/auth/signup/domain/repository/signup_repo.dart';
import 'package:grocery/src/features/auth/signup/domain/usecase/sign_up_use_case.dart';
import 'package:grocery/src/features/auth/signup/presentation/cubit/sign_up_cubit.dart';
import 'package:grocery/src/features/home/data/remote/home_api_service.dart';
import 'package:grocery/src/features/home/data/remote/home_remote_data_source.dart';
import 'package:grocery/src/features/home/domain/repos/home_repo.dart';
import 'package:grocery/src/features/home/domain/usecases/categories_usecase.dart';
import 'package:grocery/src/features/home/domain/usecases/offers_usecase.dart';
import 'package:grocery/src/features/home/domain/usecases/procuts_usecase.dart';
import 'package:grocery/src/features/home/domain/usecases/search_usecase.dart';
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
  getIt.registerLazySingleton<LoginApiService>(
    () => LoginApiService(getIt<ApiConsumer>()),
  );
  // getIt.registerLazySingleton<HomeApiServiceImpl>(
  //   () => HomeApiServiceImpl(getIt<ApiConsumer>()),
  // );
  // getIt.registerLazySingleton<HomeApiServiceImpl>(
  //   () => HomeApiServiceImpl(getIt<ApiConsumer>()),
  // );
  getIt.registerLazySingleton<HomeApiServiceImpl>(
    () => HomeApiServiceImpl(getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<ForgetPasswordApiService>(
    () => ForgetPasswordApiService(getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<VerifyCodeApiService>(
    () => VerifyCodeApiService(getIt<ApiConsumer>()),
  );

  ///! --DataSources-- ///
  getIt.registerLazySingleton<SginUpRemoteDS>(
    () => SginUpRemoteDS(getIt<SignUpApiService>()),
  );
  getIt.registerLazySingleton<LoginRemoteDs>(
    () => LoginRemoteDs(getIt<LoginApiService>()),
  );
  getIt.registerLazySingleton<HomeRemoteDataSourceImpl>(
    () => HomeRemoteDataSourceImpl(getIt<HomeApiServiceImpl>()),
  );
  // getIt.resetLazySingleton<HomeRemoteDataSourceImpl>(
  //   () => HomeRemoteDataSourceImpl(apiService: getIt<HomeApiServiceImpl>()),
  // );
  getIt.registerLazySingleton<ForgetPasswordRemoteDs>(
    () => ForgetPasswordRemoteDs(getIt<ForgetPasswordApiService>()),
  );
  getIt.registerLazySingleton<VerifyCodeRemoteDs>(
    () => VerifyCodeRemoteDs(getIt<VerifyCodeApiService>()),
  );

  /// !-- Repositories -- ///
  getIt.registerLazySingleton<RegisterRepository>(
    () => RegisterRepositoryImpl(getIt<SginUpRemoteDS>()),
  );
  getIt.registerLazySingleton<ILoginRepository>(
    () => LoginRepositoryImpl(getIt<LoginRemoteDs>()),
  );
  getIt.registerLazySingleton<ForgotPasswordRepo>(
    () => ForgotPasswordRepo(getIt<ForgetPasswordRemoteDs>()),
  );
  getIt.registerLazySingleton<VerifyCodeRepo>(
    () => VerifyCodeRepo(getIt<VerifyCodeRemoteDs>()),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(getIt<HomeRemoteDataSourceImpl>()),
  );

  /// !-- UseCases -- ///

  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<RegisterRepository>()),
  );
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<ILoginRepository>()),
  );
  getIt.registerLazySingleton<GetOffersUseCase>(
    () => GetOffersUseCase(getIt<HomeRepoImpl>()),
  );
  getIt.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(getIt<HomeRepoImpl>()),
  );

  getIt.registerLazySingleton<GetSearchProductsUseCase>(
    () => GetSearchProductsUseCase(getIt<HomeRepoImpl>()),
  );

  getIt.registerLazySingleton<GetProductsUseCase>(
    () => GetProductsUseCase(getIt<HomeRepoImpl>()),
  );
  // !Cubits //
  getIt.registerFactory<SignUpCubit>(
    () => SignUpCubit(getIt<RegisterUseCase>()),
  );
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginUseCase>()));
  getIt.registerFactory<ForgotPassworrdCubit>(
    () => ForgotPassworrdCubit(getIt<ForgotPasswordRepo>()),
  );
  getIt.registerFactory<VerifyCodeCubit>(
    () => VerifyCodeCubit(getIt<VerifyCodeRepo>()),
  );
}
