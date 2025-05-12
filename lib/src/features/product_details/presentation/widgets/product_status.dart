import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductStatus extends StatelessWidget {
  final String stockstatus;
  const ProductStatus({super.key, required this.stockstatus});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Icon(
                Icons.arrow_back_ios,
                size: 14.sp,
                color: Colors.black54,
              ),
            ),
            SizedBox(width: 12.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Text(stockstatus, style: TextStyle(fontSize: 12.sp)),
            ),
          ],
        ),
        Text(
          'حالة المنتج',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}
