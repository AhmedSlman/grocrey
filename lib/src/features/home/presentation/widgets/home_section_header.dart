import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/theme/app_colors.dart';
import 'package:grocery/core/utils/app_styles.dart';

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(title, style: AppStyles.s16Alex),
        ),
        const Spacer(),
        Text(
          'عرض الكل',
          style: AppStyles.s14Alex.copyWith(
            color: Color(0xFF333333),
            fontWeight: FontWeight.w400,
          ),
        ),
        Icon(Icons.arrow_forward_ios, size: 16.sp, color: AppColors.grey),
      ],
    );
  }
}
