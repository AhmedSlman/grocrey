import 'package:go_router/go_router.dart';
import 'package:grocery/core/routes/router_names.dart';
import 'package:grocery/src/features/auth/forgotPassword/presentation/view/forget_password_view.dart';
import 'package:grocery/src/features/auth/login/presentation/view/login_view.dart';
import 'package:grocery/src/features/auth/otpFormForPassword/presentation/view/otp_form_for_password_view.dart';
import 'package:grocery/src/features/auth/setNewPass/presentation/components/set_new_pass_component.dart';
import 'package:grocery/src/features/auth/signup/presentation/views/signup_view.dart';
import 'package:grocery/src/features/intro/onboarding.dart';
import 'package:grocery/src/features/profile/address/presentation/view/add_address.dart';
import 'package:grocery/src/features/profile/address/presentation/view/addresses.dart';
import 'package:grocery/src/features/profile/editprofile/presentation/view/edit_profile.dart';

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
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: RouterNames.register,
      builder: (context, state) => SignupView(),
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
      builder: (context, state) => SetNewPassComponent(),
    ),
    // GoRoute(
    //   path: RouterNames.home,
    //   builder: (context, state) => const HomeView(),
    // ),
    // GoRoute(
    //   path: RouterNames.profile,
    //   builder: (context, state) => ProfileView(),
    // ),
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
  ],
);
