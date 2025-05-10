import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/utils/app_shimmer.dart';
import 'package:grocery/src/features/profile/presentation/logic/orders/cubit/orders_cubit.dart';
import 'package:grocery/src/features/profile/presentation/widgets/order_item.dart';

class NewOrders extends StatelessWidget {
  const NewOrders({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<OrdersCubit>().getOrders();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الاوردرات الجديدة',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 5.h),
          SizedBox(
            height: 300.h,
            child: BlocBuilder<OrdersCubit, OrdersState>(
              builder: (context, state) {
                return state is OrdersLoaded
                    ? ListView.separated(
                      itemCount: state.ordersModel.message.length,
                      itemBuilder: (BuildContext context, int index) {
                        return OrderItem(
                          amount:
                              state.ordersModel.message[index].totalPrice
                                  .toString(),
                          orderNumber:
                              state.ordersModel.message[index].id.toString(),
                          status: state.ordersModel.message[index].orderStatus,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 10.h);
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
          ),
        ],
      ),
    );
  }
}
