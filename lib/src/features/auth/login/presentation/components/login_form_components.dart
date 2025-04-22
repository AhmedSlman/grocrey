import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/core/routes/router_names.dart';
import 'package:grocery/core/utils/app_assets.dart';
import 'package:grocery/src/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:grocery/src/features/auth/login/presentation/widgets/dont_have_an_acount_widget.dart';
import 'package:grocery/src/features/auth/login/presentation/widgets/login_fields.dart';

class LoginFormComponent extends StatefulWidget {
  const LoginFormComponent({super.key});

  @override
  State<LoginFormComponent> createState() => _LoginFormComponentState();
}

class _LoginFormComponentState extends State<LoginFormComponent> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          context.go(RouterNames.home);
        }
        if (state is LoginErrorState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorModel.message)));
        }
      },
      builder: (context, state) {
        if (state is LoginLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              LoginFields(
                emailController: emailController,
                passwordController: passwordController,
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  context.go(RouterNames.forgotPassword);
                },
                child: Text(
                  "هل نسيت كلمه السر؟",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 60.h),
              Center(
                child: CustomButton(
                  text: 'تسجيل دخول',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<LoginCubit>().login(
                        emailController.text,
                        passwordController.text,
                      );
                    }
                  },
                  height: 50.h,
                  width: 230.w,
                ),
              ),
              SizedBox(height: 20.h),
              Center(
                child: Text(
                  "سجل باستخدام",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff8E8EA9),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.googleIcon, width: 30.w, height: 30.h),
                  SizedBox(width: 20.w),
                  Image.asset(AppAssets.appleIcon, width: 30.w, height: 30.h),
                  SizedBox(width: 20.w),
                  Image.asset(
                    AppAssets.facebookIcon,
                    width: 30.w,
                    height: 30.h,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              DontHaveAnAcountWidget(),
            ],
          ),
        );
      },
    );
  }
}
