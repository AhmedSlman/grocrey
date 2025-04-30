import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/src/features/cart/presentation/logic/cubit/cart_cubit.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return state is AddCartLoading
            ? Center(child: CircularProgressIndicator())
            : CustomButton(
              text: 'اضف الي السلة',
              onPressed: () {
                context.read<CartCubit>().addToCart(false);
              },
            );
      },
    );
  }
}
