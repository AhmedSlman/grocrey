import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/functions/validator.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/core/common/widgets/custom_text_form_field.dart';
import 'package:grocery/core/utils/app_assets.dart';
import 'package:grocery/src/features/auth/forgotPassword/presentation/widgets/eamil_and_phone_tap_baar.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm>
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 67.h),
                Center(child: Image.asset(AppAssets.logoColored)),
                SizedBox(height: 20.h),
                Text(
                  'هل نسيت كلمه السر',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'الرجاء ادخال رقم الجوال الخاص بك لتعيين  ',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8E8EA9),
                  ),
                ),
                Text(
                  ' كلمه السر ',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8E8EA9),
                  ),
                ),
                SizedBox(height: 20.h),
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
                    text: 'اعاده تعيين كلمه السر',
                    onPressed: () {},
                    height: 40.h,
                    width: 230.w,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
