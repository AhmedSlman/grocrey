import 'package:flutter/material.dart';
import 'package:grocery/src/features/auth/login/presentation/components/login_form_components.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const LoginFormComponents());
  }
}
