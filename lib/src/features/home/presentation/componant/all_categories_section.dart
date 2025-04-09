import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/src/features/home/presentation/widgets/category_item_widget.dart';
import 'package:grocery/src/features/home/presentation/widgets/home_section_header.dart';

class AllCategoriesSection extends StatelessWidget {
  const AllCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const HomeSectionHeader(title: 'جميع الفئات'),
          SizedBox(height: 12.h),
          SizedBox(
            height: 61.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: CategoryItemWidget(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
