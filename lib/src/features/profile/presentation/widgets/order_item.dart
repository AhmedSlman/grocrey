import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery/core/theme/app_colors.dart';

class OrderItem extends StatelessWidget {
  final String amount;
  final String orderNumber;
  final String status;

  const OrderItem({
    super.key,
    required this.amount,
    required this.orderNumber,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'طلب: $orderNumber',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$amount جنيه',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                status,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),

              Text(
                'تم تقديم الطلب',
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Divider(),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'orders images ....',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SvgPicture.asset('assets/images/svg_images/order.svg'),
            ],
          ),
        ],
      ),
    );
  }
}
