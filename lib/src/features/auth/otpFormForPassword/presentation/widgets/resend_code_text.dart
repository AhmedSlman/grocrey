import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/theme/app_colors.dart';

class ResendCodeText extends StatelessWidget {
  const ResendCodeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'الم يصلك كود؟',
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
        children: [
          TextSpan(
            text: ' اعادة ارسال',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryColor,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }
}
