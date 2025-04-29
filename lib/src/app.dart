import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/app_cubit/app_cubit.dart';
import 'package:grocery/core/theme/app_colors.dart';
import 'package:grocery/src/features/cart/presentation/logic/cubit/cart_cubit.dart';
import 'package:grocery/src/features/cart/presentation/view/cart_view.dart';
import 'package:grocery/src/features/favourite/presentation/view/favourite_view.dart';
import 'package:grocery/src/features/home/presentation/view/home_view.dart';
import 'package:grocery/src/features/profile/presentation/views/profile_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeView(),
      FavouriteView(),
      BlocProvider(
        create: (BuildContext context) => CartCubit(),

        child: CartView(),
      ),
      ProfileView(),
    ];
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: screens[state.bottomNavBarSelectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: state.bottomNavBarSelectedIndex,
            selectedItemColor:
                AppColors.primaryColor, // اللون للأيقونة المختارة
            unselectedItemColor: Colors.black,
            onTap: (index) {
              context.read<AppCubit>().changeBottomNavBarSelectedIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.store_mall_directory_outlined),
                label: 'Shop',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.explore_outlined),
              //   label: 'Explore',
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Account',
              ),
            ],
          ),
        );
      },
    );
  }
}
