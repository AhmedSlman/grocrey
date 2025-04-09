import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/core/routes/router_names.dart';
import 'package:grocery/src/features/auth/signup/presentation/widgets/signup_fields.dart';

class SignupFormComponent extends StatelessWidget {
  const SignupFormComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SignupFields(),
        SizedBox(height: 60.h),
        CustomButton(
          text: 'انشاء حساب',
          onPressed: () {},
          height: 50.h,
          width: 230.w,
        ),
        SizedBox(height: 12.h),
        Text.rich(
          TextSpan(
            text: 'هل تمتلك حساب؟ ',
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
            children: [
              TextSpan(
                text: 'تسجيل الدخول',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                ),
                recognizer:
                    TapGestureRecognizer()
                      ..onTap = () {
                        context.go(RouterNames.login);
                      },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
