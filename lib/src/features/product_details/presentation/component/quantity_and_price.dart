import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/src/features/cart/presentation/logic/cubit/cart_cubit.dart';

class QuantityAndPrice extends StatefulWidget {
  String? quanatity;
  final String? productid;
  final String? id;

  final String? price;
  QuantityAndPrice(
    this.quanatity, {
    super.key,
    required this.productid,
    required this.id,
    required this.price,
  });

  @override
  State<QuantityAndPrice> createState() => _QuantityAndPriceState();
}

class _QuantityAndPriceState extends State<QuantityAndPrice> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return Text(
                      widget.quanatity!,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.quanatity =
                        (int.parse(widget.quanatity!) + 1).toString();
                  });
                  context.read<CartCubit>().addToCart(true, widget.productid!);
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
        Text(
          '${widget.price} جنيه',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade700,
          ),
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}
