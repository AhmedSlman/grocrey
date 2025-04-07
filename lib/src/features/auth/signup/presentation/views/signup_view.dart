import 'package:flutter/material.dart';
import 'package:grocery/src/features/auth/signup/presentation/components/signup_form_component.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const SignupFormComponent());
  }
}
