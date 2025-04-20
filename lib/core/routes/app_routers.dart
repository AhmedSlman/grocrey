import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/routes/router_names.dart';
import 'package:grocery/core/services/service_locator.dart';
import 'package:grocery/src/features/auth/forgotPassword/presentation/view/forget_password_view.dart';
import 'package:grocery/src/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:grocery/src/features/auth/login/presentation/view/login_view.dart';
import 'package:grocery/src/features/auth/otpFormForPassword/presentation/view/otp_form_for_password_view.dart';
import 'package:grocery/src/features/auth/setNewPass/presentation/view/set_new_pass_view.dart';
import 'package:grocery/src/features/auth/signup/presentation/cubit/sign_up_cubit.dart';
import 'package:grocery/src/features/auth/signup/presentation/views/signup_view.dart';
import 'package:grocery/src/features/intro/onboarding.dart';
import 'package:grocery/src/features/profile/presentation/views/add_address_view.dart';
import 'package:grocery/src/features/profile/presentation/views/addresses_view.dart';
import 'package:grocery/src/features/profile/presentation/views/edit_profile_view.dart';
import 'package:grocery/src/features/profile/presentation/views/info_view.dart';
import 'package:grocery/src/features/profile/presentation/views/orders_view.dart';
import 'package:grocery/src/features/profile/presentation/views/profile_view.dart';
import 'package:grocery/src/features/profile/presentation/views/setting_view.dart';

final GoRouter router = GoRouter(
  routes: [
    // GoRoute(
    //   path: RouterNames.splash,
    //   builder: (context, state) => const SplashView(),
    // ),
    GoRoute(
      path: RouterNames.onboarding,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: RouterNames.login,
      builder:
          (context, state) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginView(),
          ),
    ),
    GoRoute(
      path: RouterNames.register,
      builder:
          (context, state) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: SignupView(),
          ),
    ),
    GoRoute(
      path: RouterNames.forgotPassword,
      builder: (context, state) => ForgetPasswordView(),
    ),
    GoRoute(
      path: RouterNames.otpFormForPassword,
      builder: (context, state) => OtpForPasswordView(),
    ),
    GoRoute(
      path: RouterNames.setAnewPassword,
      builder: (context, state) => SetNewPassView(),
    ),
    // GoRoute(
    //   path: RouterNames.home,
    //   builder: (context, state) => const HomeView(),
    // ),
    GoRoute(
      path: RouterNames.profile,
      builder: (context, state) => ProfileView(),
    ),
    GoRoute(
      path: RouterNames.editProfile,
      builder: (context, state) => EditProfileView(),
    ),
    GoRoute(
      path: RouterNames.addresses,
      builder: (context, state) => AddressesView(),
    ),
    GoRoute(
      path: RouterNames.add_addresses,
      builder: (context, state) => AddAddressView(),
    ),

    GoRoute(
      path: RouterNames.setting,
      builder: (context, state) => SettingView(),
    ),
    GoRoute(
      path: RouterNames.orders,
      builder: (context, state) => OrdersView(),
    ),
    GoRoute(
      path: RouterNames.about_info,
      builder: (context, state) => InfoView(),
    ),
  ],
);
