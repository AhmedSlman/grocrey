import 'package:flutter/material.dart';
import 'package:grocery/core/common/widgets/custom_profile_header.dart';
import 'package:grocery/src/features/profile/presentation/component/new_orders.dart';
import 'package:grocery/src/features/profile/presentation/component/previos_orders.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomProfileHeader(header: 'طلباتي'),

          NewOrders(),

          PreviosOrders(),
        ],
      ),
    );
  }
}
