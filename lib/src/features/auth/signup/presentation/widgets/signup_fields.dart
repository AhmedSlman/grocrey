import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/functions/validator.dart';
import 'package:grocery/core/common/widgets/auth_text_field.dart';

class SignupFields extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController familyNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const SignupFields({
    super.key,
    required this.firstNameController,
    required this.familyNameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AuthTextField(
                controller: firstNameController,
                label: 'الاسم الاول',
                hint: 'أدخل اسمك',
                icon: Icons.edit_calendar_outlined,
                labelText: 'First Name',
                validator: Validator.validateName,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: AuthTextField(
                controller: familyNameController,
                label: 'اسم العائلة',
                hint: 'أدخل اسم العائلة',
                icon: Icons.family_restroom,
                labelText: 'Family Name',
                validator: Validator.validateName,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        AuthTextField(
          controller: emailController,
          label: 'البريد الالكترونى',
          hint: 'أدخل بريدك الإلكتروني',
          icon: Icons.email,
          labelText: 'Email',
          validator: Validator.validateEmail,
        ),
        SizedBox(height: 20.h),
        AuthTextField(
          controller: phoneController,
          label: 'رقم الجوال',
          hint: 'أدخل رقم الهاتف الخاص بك',
          icon: Icons.phone,
          labelText: 'phone',
          keyboardType: TextInputType.phone,
          validator: Validator.validatePhoneNumber,
        ),
        SizedBox(height: 20.h),
        AuthTextField(
          controller: passwordController,
          label: 'كلمه المرور',
          hint: 'أدخل كلمة المرور الخاصة بك',
          icon: Icons.lock,
          labelText: 'Password',
          isPassword: true,
          validator: Validator.validatePassword,
        ),
        SizedBox(height: 20.h),
        AuthTextField(
          controller: confirmPasswordController,
          label: 'تاكيد كلمه المرور',
          hint: 'تاكيد كلمه المرور',
          icon: Icons.lock,
          labelText: 'confirm Password',
          isPassword: true,
          validator: Validator.validatePassword,
        ),
      ],
    );
  }
}
