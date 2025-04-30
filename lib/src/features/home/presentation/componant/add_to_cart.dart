import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/src/features/cart/presentation/logic/cubit/cart_cubit.dart';

class AddToCart extends StatelessWidget {
  final String id;
  const AddToCart({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      builder: (context, state) {
        return state is AddCartLoading
            ? Center(child: CircularProgressIndicator())
            : CustomButton(
              text: 'اضف الي السلة',
              onPressed: () {
                context.read<CartCubit>().addToCart(false, id);
              },
            );
      },
      listener: (BuildContext context, CartState state) {
        if (state is AddCartSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('تمت الاضافة بنجاح'),
              duration: Duration(seconds: 2),
            ),
          );
        } else if (state is AddCartFail) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('فشل في الاضافة'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
    );
  }
}
