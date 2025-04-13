import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/theme/app_colors.dart';

class ResendTextRow extends StatelessWidget {
  const ResendTextRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 8.w),
          Text(
            "لم تتلقَ الرمز؟",
            style: TextStyle(color: Colors.black, fontSize: 14.sp),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "إعادة الإرسال",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Spacer(),
          Text("0:36", style: TextStyle(color: Colors.grey, fontSize: 14)),
        ],
      ),
    );
  }
}
