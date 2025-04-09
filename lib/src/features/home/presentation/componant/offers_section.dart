import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/utils/app_assets.dart';
import 'package:grocery/src/features/home/presentation/widgets/home_section_header.dart';
import 'package:grocery/src/features/home/presentation/widgets/product_card_widget.dart';

class OffersSection extends StatelessWidget {
  const OffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),

      child: Column(
        children: [
          const HomeSectionHeader(title: 'اشهر العروض'),
          SizedBox(height: 12.h),
          SizedBox(
            height: 250.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: ProductCard(
                    title: 'كيلو فراخ بانيه',
                    size: '33',
                    currentPrice: '250 جنيه',
                    originalPrice: '300 جنيه',
                    imagePath: AppAssets.product,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
