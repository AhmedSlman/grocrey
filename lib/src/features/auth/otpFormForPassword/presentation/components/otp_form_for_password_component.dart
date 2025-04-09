import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/utils/app_assets.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import '../widgets/otp_fields_row.dart';
import '../widgets/resend_code_text.dart';

class OtpFormForPasswordComponent extends StatelessWidget {
  const OtpFormForPasswordComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 67.h),
        Center(child: Image.asset(AppAssets.logoColored)),
        SizedBox(height: 9.h),
        Text(
          'تحقق من بريدك الالكترونى',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 10.h),
        Text(
          'ادخال الرمز المكون من 4 ارقام المذكور فى البريد',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 36.h),
        const OtpFieldsRow(),
        SizedBox(height: 20.h),
        Center(
          child: Column(
            children: [
              CustomButton(
                width: 230.w,
                height: 40.h,
                onPressed: () {},
                text: 'تحقق من الرمز',
              ),
              SizedBox(height: 12.h),
              ResendCodeText(),
            ],
          ),
        ),
      ],
    );
  }
}
