import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/core/common/widgets/custom_text_form_field.dart';
import 'package:grocery/core/utils/app_assets.dart';
import 'package:grocery/src/features/auth/login/presentation/view/login_view.dart';

class SignupFormComponent extends StatefulWidget {
  const SignupFormComponent({super.key});

  @override
  State<SignupFormComponent> createState() => _SignupFormComponentState();
}

class _SignupFormComponentState extends State<SignupFormComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 87.h),
              Center(
                child: Image.asset(
                  AppAssets.logoColored,
                  width: 80.w,
                  height: 50.h,
                ),
              ),
              SizedBox(height: 42.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'تسجيل حساب جديد',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 7.w),
                      Text(
                        'ادخل البيانات الخاصه بك للمتابعه',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 30.h),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'الاسم الاول',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        CustomTextFormField(
                          labelText: 'First Name',
                          hintText: 'أدخل اسمك',
                          prefixIcon: Icon(
                            Icons.edit_calendar_outlined,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'اسم العائلة',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        CustomTextFormField(
                          labelText: 'Family Name',
                          hintText: 'أدخل اسم العائلة',
                          prefixIcon: Icon(
                            Icons.family_restroom,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),
              Text(
                'البريد الالكترونى',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                labelText: 'Email',
                hintText: 'أدخل بريدك الإلكتروني',
                prefixIcon: Icon(Icons.email, color: Colors.grey[600]),
              ),

              SizedBox(height: 20.h),
              Text(
                'رقم الجوال',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                labelText: 'phone',
                hintText: 'أدخل رقم الهاتف الخاص بك',
                prefixIcon: Icon(Icons.phone, color: Colors.grey[600]),
                keyboardType: TextInputType.phone,
              ),

              SizedBox(height: 20.h),
              Text(
                'كلمه المرور',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                labelText: 'Password',
                hintText: 'أدخل كلمة المرور الخاصة بك',
                isPassword: true,
                prefixIcon: Icon(Icons.lock, color: Colors.grey[600]),
              ),

              SizedBox(height: 20.h),
              Text(
                'تاكيد كلمه المرور',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                labelText: 'confirm Password',
                hintText: 'تاكيد كلمه المرور',
                isPassword: true,
                prefixIcon: Icon(Icons.lock, color: Colors.grey[600]),
              ),

              SizedBox(height: 60.h),
              Center(
                child: CustomButton(
                  text: 'انشاء حساب',
                  onPressed: () {},
                  height: 50.h,
                  width: 230.w,
                ),
              ),
              SizedBox(height: 12.h),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: 'هل تمتلك حساب؟ ',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginView(),
                                  ),
                                );
                              },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
