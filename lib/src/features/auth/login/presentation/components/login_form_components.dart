import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/core/common/widgets/custom_text_form_field.dart';
import 'package:grocery/core/routes/router_names.dart';
import 'package:grocery/core/utils/app_assets.dart';

class LoginFormComponents extends StatefulWidget {
  const LoginFormComponents({super.key});

  @override
  State<LoginFormComponents> createState() => _LoginFormComponentsState();
}

class _LoginFormComponentsState extends State<LoginFormComponents> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 87.h),
          Center(
            child: Image.asset(AppAssets.logoColored, width: 80, height: 50),
          ),
          SizedBox(height: 42.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' تسجيل الدخول',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    'أدخل بريدك الإلكتروني وكلمة المرور',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            'البريد الالكترونى',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            labelText: 'Email',
            hintText: 'أدخل بريدك الإلكتروني',
            prefixIcon: Icon(Icons.email, color: Colors.grey[600]),
          ),
          const SizedBox(height: 20),
          Text(
            'كلمه المرور',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            labelText: 'Password',
            hintText: ' أدخل كلمة المرور الخاصة بك ',
            isPassword: true,
            prefixIcon: Icon(Icons.lock, color: Colors.grey[600]),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              context.go(RouterNames.forgotPassword);
            },
            child: Text(
              "هل نسيت كلمه السر؟",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 60.h),
          Center(
            child: CustomButton(
              text: 'تسجيل دخول',
              onPressed: () {},
              height: 50,
              width: 230,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              "سجل باستخدام",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff8E8EA9),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.googleIcon, width: 30.w, height: 30.h),
              const SizedBox(width: 20),
              Image.asset(AppAssets.facebookIcon, width: 30.w, height: 30.h),
              const SizedBox(width: 20),
              Image.asset(AppAssets.appleIcon, width: 30.w, height: 30.h),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: Text.rich(
              TextSpan(
                text: "الا تمتلك حساب؟",

                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff8E8EA9),
                ),
                children: [
                  TextSpan(
                    text: " انشاء حساب",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff34344A),
                    ),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            context.go(RouterNames.register);
                          },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
