import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/core/routes/router_names.dart';
import 'package:grocery/core/utils/app_assets.dart';
import 'package:grocery/src/features/auth/login/presentation/widgets/dont_have_an_acount_widget.dart';
import 'package:grocery/src/features/auth/login/presentation/widgets/login_fields.dart';

class LoginFormComponent extends StatelessWidget {
  const LoginFormComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const LoginFields(),
        SizedBox(height: 20.h),
        GestureDetector(
          onTap: () {
            context.go(RouterNames.forgotPassword);
          },
          child: Text(
            "هل نسيت كلمه السر؟",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 60.h),
        Center(
          child: CustomButton(
            text: 'تسجيل دخول',
            onPressed: () {},
            height: 50.h,
            width: 230.w,
          ),
        ),
        SizedBox(height: 20.h),
        Center(
          child: Text(
            "سجل باستخدام",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xff8E8EA9),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.googleIcon, width: 30.w, height: 30.h),
            SizedBox(width: 20.w),
            Image.asset(AppAssets.appleIcon, width: 30.w, height: 30.h),
            SizedBox(width: 20.w),
            Image.asset(AppAssets.facebookIcon, width: 30.w, height: 30.h),
          ],
        ),
        SizedBox(height: 20.h),
        DontHaveAnAcountWidget(),
      ],
    );
  }
}
