import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/utils/app_shimmer.dart';

class ProductDetailShimmer extends StatelessWidget {
  const ProductDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.h),
        const AppShimmer(width: double.infinity, height: 300, radius: 40),
        SizedBox(height: 20.h),
        const AppShimmer(width: double.infinity, height: 50, radius: 40),
        SizedBox(height: 20.h),
        const AppShimmer(width: double.infinity, height: 50, radius: 40),
        SizedBox(height: 20.h),
        const AppShimmer(width: double.infinity, height: 50, radius: 40),
        Spacer(),
        AppShimmer(width: double.infinity, height: 50, radius: 40),
        Container(height: 20),
      ],
    );
  }
}
