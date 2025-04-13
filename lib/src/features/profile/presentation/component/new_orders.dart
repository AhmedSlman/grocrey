import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/src/features/profile/presentation/widgets/order_item.dart';

class NewOrders extends StatelessWidget {
  const NewOrders({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return OrderItem(
                  amount: '300 جنيه',
                  orderNumber: '6524',
                  status: 'status',
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 10.h);
              },
            ),
          ),
        ],
      ),
    );
  }
}
