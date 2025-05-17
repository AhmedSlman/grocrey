import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/app_cubit/app_cubit.dart';
import 'package:grocery/core/routes/router_names.dart';
import 'package:grocery/core/services/service_locator.dart';
import 'package:grocery/src/app.dart';
import 'package:grocery/src/features/auth/forgotPassword/presentation/cubit/forgot_passworrd_cubit.dart';
import 'package:grocery/src/features/auth/forgotPassword/presentation/view/forget_password_view.dart';
import 'package:grocery/src/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:grocery/src/features/auth/login/presentation/view/login_view.dart';
import 'package:grocery/src/features/auth/otpFormForPassword/presentation/cubit/verify_code_cubit.dart';
import 'package:grocery/src/features/auth/otpFormForPassword/presentation/view/otp_form_for_password_view.dart';
import 'package:grocery/src/features/auth/setNewPass/presentation/view/set_new_pass_view.dart';
import 'package:grocery/src/features/auth/signup/presentation/cubit/sign_up_cubit.dart';
import 'package:grocery/src/features/auth/signup/presentation/views/signup_view.dart';
import 'package:grocery/src/features/cart/presentation/logic/cubit/cart_cubit.dart';
import 'package:grocery/src/features/cart/presentation/view/cart_view.dart';
import 'package:grocery/src/features/favourite/presentation/logic/cubit/favourite_cubit.dart';
import 'package:grocery/src/features/home/presentation/componant/search_compenent.dart';
import 'package:grocery/src/features/home/presentation/logic/categories/getcategories_cubit.dart';
import 'package:grocery/src/features/home/presentation/logic/location/cubit/location_cubit.dart';
import 'package:grocery/src/features/home/presentation/logic/offers/cubit/offers_cubit.dart';
import 'package:grocery/src/features/home/presentation/logic/search/cubit/search_cubit.dart';
import 'package:grocery/src/features/intro/onboarding.dart';
import 'package:grocery/src/features/intro/splash.dart';
import 'package:grocery/src/features/product_details/presentation/logic/product/cubit/product_cubit.dart';
import 'package:grocery/src/features/product_details/presentation/view/product_details_view.dart';
import 'package:grocery/src/features/profile/presentation/logic/orders/cubit/orders_cubit.dart';
import 'package:grocery/src/features/profile/presentation/logic/profile_cubit/profile_cubit.dart';


import 'package:grocery/src/features/profile/presentation/views/add_address_view.dart';
import 'package:grocery/src/features/profile/presentation/views/addresses_view.dart';
import 'package:grocery/src/features/profile/presentation/views/edit_profile_view.dart';
import 'package:grocery/src/features/profile/presentation/views/info_view.dart';
import 'package:grocery/src/features/profile/presentation/views/orders_view.dart';
import 'package:grocery/src/features/profile/presentation/views/profile_view.dart';
import 'package:grocery/src/features/profile/presentation/views/setting_view.dart';

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
      builder:
          (context, state) => MultiBlocProvider(
            providers: [BlocProvider(create: (context) => getIt<LoginCubit>())],
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
      path: RouterNames.myApp,
      builder:
          (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GetcategoriesCubit()..getCategories(),
              ),
              BlocProvider(create: (context) => OffersCubit()..getOffers()),
              BlocProvider(create: (context) => FavouriteCubit()),
              BlocProvider(create: (context) => CartCubit()),
              BlocProvider(create: (context) => AppCubit()),
              BlocProvider(
                create: (context) => ProfileCubit()..getProfileData(),
              ),
              BlocProvider(create: (context) => LocationCubit()..getLocation()),
            ],
            child: MyApp(),
          ),
    ),
    GoRoute(path: RouterNames.cart, builder: (context, state) => CartView()),
    GoRoute(
      path: RouterNames.forgotPassword,
      builder:
          (context, state) => BlocProvider(
            create: (context) => getIt<ForgotPassworrdCubit>(),
            child: ForgetPasswordView(),
          ),
    ),

    GoRoute(
      path: RouterNames.otpFormForPassword,
      builder:
          (context, state) => BlocProvider(
            create: (context) => getIt<VerifyCodeCubit>(),
            child: OtpForPasswordView(),
          ),
    ),
    // GoRoute(
    //   path: RouterNames.otpFormForPassword,
    //   builder:
    //       (context, state) => BlocProvider(
    //         create: (context) => getIt<VerifyCodeCubit>(),
    //         child: OtpForPasswordView(),
    //       ),
    // ),
    GoRoute(
      path: RouterNames.setAnewPassword,
      builder:
          (context, state) => BlocProvider(
            create: (context) => getIt<VerifyCodeCubit>(),
            child: SetNewPassView(),
          ),
    ),
    GoRoute(
      path: RouterNames.home,
      builder:
          (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => GetcategoriesCubit()),
              BlocProvider(create: (context) => FavouriteCubit()),
              BlocProvider(create: (context) => AppCubit()),
              BlocProvider(create: (context) => SearchCubit()),
              BlocProvider(create: (context) => CartCubit()),
              BlocProvider(
                create: (context) => ProfileCubit()..getProfileData(),
              ),
            ],
            child: const MyApp(),
          ),
    ),

    GoRoute(
      path: RouterNames.profile,
      builder: (context, state) => ProfileView(),
    ),
    GoRoute(
      path: RouterNames.editProfile,
      builder:
          (context, state) => BlocProvider(
            create: (context) => ProfileCubit(),
            child: EditProfileView(),
          ),
    ),
    GoRoute(
      path: RouterNames.addresses,
      builder: (context, state) => AddressesView(),
    ),
    GoRoute(
      path: RouterNames.addresses,
      builder: (context, state) => AddAddressView(),
    ),

    GoRoute(
      path: RouterNames.setting,
      builder: (context, state) => SettingView(),
    ),
    GoRoute(
      path: RouterNames.orders,
      builder:
          (context, state) => BlocProvider(
            create: (context) => OrdersCubit(),
            child: OrdersView(),
          ),
    ),
    GoRoute(
      path: RouterNames.aboutInfo,
      builder: (context, state) => InfoView(),
    ),
    GoRoute(
      path: '${RouterNames.productDetails}/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => FavouriteCubit()),
            BlocProvider(create: (context) => ProductCubit()),

            BlocProvider(create: (context) => CartCubit()..getFromCart()),
          ],
          child: ProductDetailsView(productid: id.toString()),
        );
      },
    ),
    GoRoute(
      path: RouterNames.search,
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => SearchCubit()..getProducts('')),
            BlocProvider(create: (context) => CartCubit()),
          ],
          child: SearchComponent(),
        );
      },
    ),
  ],
);
