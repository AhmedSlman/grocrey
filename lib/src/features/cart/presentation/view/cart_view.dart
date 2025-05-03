import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/core/theme/app_colors.dart';
import 'package:grocery/src/features/cart/presentation/component/cart_component.dart';
import 'package:grocery/src/features/cart/presentation/logic/cubit/cart_cubit.dart';
import 'package:grocery/src/features/cart/presentation/view/checkout_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CartCubit>().getFromCart();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text('السلة', style: TextStyle(color: AppColors.black)),
        centerTitle: true,

        //actions: [Image.asset('assets/images/edit.png')],
      ),
      body: CartSection(),
      bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return state is GetCartSuccess
              ? Container(
                height: 60.h,
                width: double.infinity,
                color: AppColors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'المجموع : ${state.cart.total}',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, bottom: 5),
                      child: SizedBox(
                        width: 150.w,
                        child:
                            state.cart.cart.isNotEmpty
                                ? CustomButton(
                                  onPressed: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (c) {
                                          return CheckoutView(
                                            totalprice:
                                                state.cart.total.toString(),
                                          );
                                        },
                                      ),
                                    );
                                    context.read<CartCubit>().getFromCart();
                                  },
                                  text: 'اتمام الطلب',
                                )
                                : Container(),
                      ),
                    ),
                  ],
                ),
              )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
