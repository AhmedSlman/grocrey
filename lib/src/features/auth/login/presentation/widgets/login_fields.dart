import 'package:flutter/material.dart';
import 'package:grocery/core/common/widgets/auth_text_field.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTextField(
          label: 'البريد الإلكتروني',
          hint: 'أدخل بريدك الإلكتروني',
          labelText: 'Email',
          icon: Icons.email,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20),
        AuthTextField(
          label: 'كلمة المرور',
          hint: 'أدخل كلمة المرور الخاصة بك',
          labelText: 'Password',
          icon: Icons.lock,
          isPassword: true,
        ),
      ],
    );
  }
}
