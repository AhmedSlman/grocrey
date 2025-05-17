import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/core/common/widgets/custom_text_form_field.dart';
import 'package:grocery/core/routes/router_names.dart';
import 'package:grocery/core/utils/app_assets.dart';
import 'package:grocery/src/features/auth/otpFormForPassword/presentation/cubit/verify_code_cubit.dart';

class SetNewPassView extends StatefulWidget {
  const SetNewPassView({super.key});

  @override
  State<SetNewPassView> createState() => _SetNewPassViewState();
}

class _SetNewPassViewState extends State<SetNewPassView> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data =
        GoRouterState.of(context).extra as Map<String, dynamic>;
    final String email = data['email'];
    final String otpCode = data['otp'];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocConsumer<VerifyCodeCubit, VerifyCodeState>(
            listener: (context, state) {
              if (state is VerifyCodeSuccessState) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RouterNames.login,
                  (route) => false,
                );
              } else if (state is VerifyCodeErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 67.h),
                    Center(child: Image.asset(AppAssets.logoColored)),
                    SizedBox(height: 9.h),
                    Text(
                      'ادخل كلمه المرور الجديده',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'قم بانشاء كلمه مرور جديده',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Text(
                      'كلمه المرور',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      controller: _passwordController,
                      labelText: 'Password',
                      hintText: 'أدخل كلمة المرور الخاصة بك',
                      isPassword: true,
                      prefixIcon: Icon(Icons.lock, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'تاكيد كلمه المرور',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      controller: _confirmPasswordController,
                      labelText: 'Confirm Password',
                      hintText: 'تاكيد كلمه المرور',
                      isPassword: true,
                      prefixIcon: Icon(Icons.lock, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 60.h),
                    Center(
                      child: CustomButton(
                        text: state is VerifyCodeLoadingState
                            ? 'جاري التحديث...'
                            : 'تحديث كلمه المرور',
                        onPressed: state is VerifyCodeLoadingState
                            ? null
                            : () {
                                final password =
                                    _passwordController.text.trim();
                                final confirmPassword =
                                    _confirmPasswordController.text.trim();

                                if (password.isEmpty ||
                                    confirmPassword.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('من فضلك أدخل كل الحقول'),
                                    ),
                                  );
                                  return;
                                }

                                if (password != confirmPassword) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'كلمة المرور وتأكيدها غير متطابقين'),
                                    ),
                                  );
                                  return;
                                }

                                context.read<VerifyCodeCubit>().verifyCode(
                                      email,
                                      otpCode,
                                      password,
                                      confirmPassword,
                                    );
                              },
                        width: 230.w,
                        height: 40.h,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
