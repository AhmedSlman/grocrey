import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/src/features/auth/forgotPassword/presentation/components/forgot_password_component.dart';
import 'package:grocery/core/utils/app_assets.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 67.h),
              Center(child: Image.asset(AppAssets.logoColored)),
              SizedBox(height: 20.h),
              Text(
                'هل نسيت كلمه السر',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10.h),
              Text(
                'الرجاء ادخال رقم الجوال الخاص بك أو البريد الإلكتروني لتعيين كلمة السر.',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF8E8EA9),
                ),
              ),
              SizedBox(height: 20.h),
              const ForgetPasswordComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
