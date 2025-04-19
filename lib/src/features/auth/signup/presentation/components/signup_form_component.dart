import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/core/routes/router_names.dart';
import 'package:grocery/src/features/auth/signup/data/model/sign_up_model.dart';
import 'package:grocery/src/features/auth/signup/presentation/cubit/sign_up_cubit.dart';
import 'package:grocery/src/features/auth/signup/presentation/widgets/signup_fields.dart';

class SignupFormComponent extends StatefulWidget {
  const SignupFormComponent({super.key});

  @override
  State<SignupFormComponent> createState() => _SignupFormComponentState();
}

class _SignupFormComponentState extends State<SignupFormComponent> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final familyNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    familyNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          context.go(RouterNames.login);
        } else if (state is RegisterFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage.toString())),
          );
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SignupFields(
              firstNameController: firstNameController,
              familyNameController: familyNameController,
              emailController: emailController,
              phoneController: phoneController,
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
            ),
            SizedBox(height: 60.h),
            BlocBuilder<SignUpCubit, SignUpState>(
              builder: (context, state) {
                return CustomButton(
                  text: 'انشاء حساب',
                  onPressed: () {
                    {
                      if (_formKey.currentState!.validate()) {
                        context.read<SignUpCubit>().register(
                          SignUpModel(
                            firstName: firstNameController.text,
                            lastName: familyNameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            password: passwordController.text,
                            passwordConfirmation:
                                confirmPasswordController.text,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('يرجى ملء جميع الحقول بشكل صحيح'),
                          ),
                        );
                      }
                    }
                  },

                  isLoading: state is RegisterLoadingState,
                  height: 50.h,
                  width: 230.w,
                );
              },
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
                          ..onTap = () => context.go(RouterNames.login),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
