import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/theme/app_colors.dart';
import 'package:grocery/core/utils/app_styles.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String size;
  final String currentPrice;
  final String originalPrice;
  final String imagePath;
  final VoidCallback? onAddPressed;

  const ProductCard({
    super.key,
    required this.title,
    required this.size,
    required this.currentPrice,
    required this.originalPrice,
    required this.imagePath,
    this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 173.h,
      height: 227.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.lightBorderGrey, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Image.asset(imagePath, height: 120, fit: BoxFit.contain),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.s12Alex.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  size,
                  style: AppStyles.s12Alex.copyWith(color: AppColors.grey),
                ),
              ],
            ),

            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: onAddPressed,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: Color(0xFF0A6986),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ),

                Row(
                  children: [
                    Text(
                      originalPrice,
                      style: AppStyles.s12Alex.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      currentPrice,
                      style: AppStyles.s12Alex.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
