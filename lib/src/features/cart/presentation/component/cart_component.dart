import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/utils/app_shimmer.dart';
import 'package:grocery/src/features/cart/presentation/logic/cubit/cart_cubit.dart';
import 'package:grocery/src/features/cart/presentation/widgets/cart_card.dart';

class CartSection extends StatelessWidget {
  const CartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return state is GetCartSuccess
              ? state.cart.cart.isEmpty
                  ? Center(child: Text('لا توجد عناصر في السلة'))
                  : ListView.builder(
                    itemCount: state.cart.cart.length,
                    itemBuilder: (context, index) {
                      return CartCard(cart: state.cart.cart[index]);
                    },
                  )
              : ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppShimmer(height: 80.h),
                    ),
                  );
                },
              );
        },
      ),
    );
  }
}
