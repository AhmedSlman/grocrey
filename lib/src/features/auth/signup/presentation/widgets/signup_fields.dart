import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/widgets/auth_text_field.dart';

class SignupFields extends StatelessWidget {
  const SignupFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AuthTextField(
                label: 'الاسم الاول',
                hint: 'أدخل اسمك',
                icon: Icons.edit_calendar_outlined,
                labelText: 'First Name',
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: AuthTextField(
                label: 'اسم العائلة',
                hint: 'أدخل اسم العائلة',
                icon: Icons.family_restroom,
                labelText: 'Family Name',
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        AuthTextField(
          label: 'البريد الالكترونى',
          hint: 'أدخل بريدك الإلكتروني',
          icon: Icons.email,
          labelText: 'Email',
        ),
        SizedBox(height: 20.h),
        AuthTextField(
          label: 'رقم الجوال',
          hint: 'أدخل رقم الهاتف الخاص بك',
          icon: Icons.phone,
          labelText: 'phone',
          keyboardType: TextInputType.phone,
        ),
        SizedBox(height: 20.h),
        AuthTextField(
          label: 'كلمه المرور',
          hint: 'أدخل كلمة المرور الخاصة بك',
          icon: Icons.lock,
          labelText: 'Password',
          isPassword: true,
        ),
        SizedBox(height: 20.h),
        AuthTextField(
          label: 'تاكيد كلمه المرور',
          hint: 'تاكيد كلمه المرور',
          icon: Icons.lock,
          labelText: 'confirm Password',
          isPassword: true,
        ),
      ],
    );
  }
}
