import 'package:go_router/go_router.dart';
import 'package:grocery/core/routes/router_names.dart';
import 'package:grocery/src/features/auth/login/presentation/view/login_view.dart';
import 'package:grocery/src/features/intro/onboarding.dart';
import 'package:grocery/src/features/intro/splash.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RouterNames.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: RouterNames.onboarding,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: RouterNames.login,
      builder: (context, state) => const LoginView(),
    ),
  ],
);
