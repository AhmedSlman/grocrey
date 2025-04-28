import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/constants/endpoints_strings.dart';
import 'package:grocery/core/theme/app_colors.dart';
import 'package:grocery/src/features/cart/data/model/cart_model.dart';
import 'package:grocery/src/features/cart/presentation/logic/cubit/cart_cubit.dart';

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
        // leading: Container(
        //   decoration: BoxDecoration(
        //     color: AppColors.lightGrey,
        //     borderRadius: BorderRadius.circular(80),
        //   ),

        //   child: IconButton(
        //     onPressed: () {
        //       context.pop();
        //     },
        //     icon: Icon(
        //       Icons.arrow_back_ios,
        //       color: AppColors.black,
        //       size: 15,
        //     ),
        //   ),
        // ),
        actions: [Image.asset('assets/images/edit.png')],
      ),
      body: SizedBox(
        height: 500,
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return state is GetCartSuccess
                ? ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return CartItem(cart: state.cart);
                  },
                )
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final CartModel cart;
  const CartItem({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // صورة المنتج
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  EndpointsStrings.baseUrl + cart.cart[0].product!.imagePath,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),

              // الاسم والوصف
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      cart.cart[0].product!.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      cart.cart[0].product!.quantity.toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              // السعر وزر التحكم في الكمية
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cart.cart[0].product!.price.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade200,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove, color: Colors.blue),
                          onPressed: () {},
                        ),
                        const Text('1', style: TextStyle(fontSize: 16)),
                        IconButton(
                          icon: const Icon(Icons.add, color: Colors.blue),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
