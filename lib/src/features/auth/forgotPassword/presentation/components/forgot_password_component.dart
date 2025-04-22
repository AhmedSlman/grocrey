import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/common/functions/validator.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/core/common/widgets/custom_text_form_field.dart';
import 'package:grocery/core/routes/router_names.dart';
import 'package:grocery/src/features/auth/forgotPassword/presentation/widgets/eamil_and_phone_tap_baar.dart';
import 'package:grocery/src/features/auth/forgotPassword/presentation/cubit/forgot_passworrd_cubit.dart';

class ForgetPasswordComponent extends StatefulWidget {
  const ForgetPasswordComponent({super.key});

  @override
  State<ForgetPasswordComponent> createState() =>
      _ForgetPasswordComponentState();
}

class _ForgetPasswordComponentState extends State<ForgetPasswordComponent>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPassworrdCubit, ForgotPassworrdState>(
      listener: (context, state) {
        if (state is ForgotPassworrdSuccessState) {
          final index = _tabController.index;
          final email =
              index == 0
                  ? _phoneController.text.trim()
                  : _emailController.text.trim();
          context.go(RouterNames.otpFormForPassword, extra: {'email': email});
        } else if (state is ForgotPassworrdErrorState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EmailAndPhoneTapBarWidget(
                tabController: _tabController,
                title1: "رقم الجوال",
                title2: 'البريد الالكترونى',
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 100.h,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    CustomTextFormField(
                      controller: _phoneController,
                      validator: Validator.validatePhoneNumber,
                      hintText: 'أدخل رقم الهاتف',
                      labelText: 'رقم الهاتف',
                      prefixIcon: Icon(Icons.phone, color: Colors.grey[600]),
                      keyboardType: TextInputType.phone,
                    ),
                    CustomTextFormField(
                      controller: _emailController,
                      validator: Validator.validateEmail,
                      hintText: 'أدخل البريد الإلكتروني',
                      labelText: 'البريد الإلكتروني',
                      prefixIcon: Icon(Icons.email, color: Colors.grey[600]),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60.h),
              Center(
                child: CustomButton(
                  text:
                      state is ForgotPassworrdLoadingState
                          ? 'جاري الإرسال...'
                          : 'اعاده تعيين كلمه السر',
                  onPressed:
                      state is! ForgotPassworrdLoadingState
                          ? () {
                            if (_formKey.currentState!.validate()) {
                              final cubit =
                                  context.read<ForgotPassworrdCubit>();
                              final index = _tabController.index;

                              if (index == 0) {
                                cubit.forgotPassword(
                                  email: _phoneController.text.trim(),
                                );
                              } else {
                                cubit.forgotPassword(
                                  email: _emailController.text.trim(),
                                );
                              }
                            }
                          }
                          : () {},
                  height: 40.h,
                  width: 230.w,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
