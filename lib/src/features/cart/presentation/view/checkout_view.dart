import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/core/utils/app_shimmer.dart';
import 'package:grocery/src/features/cart/presentation/logic/cubit/cart_cubit.dart';
import 'package:grocery/src/features/home/presentation/logic/location/cubit/location_cubit.dart';

class CheckoutView extends StatelessWidget {
  final String totalprice;

  const CheckoutView({super.key, required this.totalprice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        elevation: 0,
        centerTitle: true,
        title: const Text('الدفع', style: TextStyle(color: Colors.black)),

        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'توصيل الي',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(width: 10.w),
                  BlocBuilder<LocationCubit, LocationState>(
                    builder: (context, state) {
                      return state is LoadingGetLocation
                          ? AppShimmer(height: 30, width: 160)
                          : state is SuccessGetLocation
                          ? SizedBox(
                            width: 200.w,
                            child: Text(
                              state.location,

                              //   overflow: TextOverflow.clip,
                              style: TextStyle(overflow: TextOverflow.clip),
                            ),
                          )
                          : state is FailGetLocation
                          ? Text(state.error)
                          : Container();
                    },
                  ),

                  Spacer(),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
              const SizedBox(height: 24),

              const Divider(height: 32),
              Row(
                children: [
                  const Text(
                    'طرق الدفع',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Spacer(),

                  Row(
                    children: [
                      const Text(
                        '0256 **** **** ****',
                        style: TextStyle(fontSize: 14),
                      ),

                      Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Visa.svg/1200px-Visa.svg.png',
                        height: 20,
                        width: 40,
                      ),
                    ],
                  ),

                  // const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                ],
              ),

              const Divider(height: 32),

              buildTotalRow('المجموع الكلى', totalprice),

              const Spacer(),

              BlocProvider(
                create: (context) => CartCubit(),
                child: BlocConsumer<CartCubit, CartState>(
                  builder: (context, state) {
                    return state is CreateOrderLoading
                        ? Center(child: CircularProgressIndicator())
                        : CustomButton(
                          text: 'اطلب',
                          onPressed: () {
                            context.read<CartCubit>().createOrder(totalprice);
                          },
                        );
                  },
                  listener: (BuildContext context, CartState state) async {
                    if (state is CreateOrderSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('تم انشاء الطلب بنجاح'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      //await context.read<CartCubit>().getFromCart();
                      Navigator.pop(context);
                    } else if (state is CreateOrderFail) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPriceRow(String title, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            amount,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }

  Widget buildTotalRow(String title, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),
          Text(
            '$amount  جنيه',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
