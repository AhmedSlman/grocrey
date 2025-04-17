import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/core/common/widgets/custom_text_form_field.dart'
    show CustomTextFormField;
import 'package:grocery/core/utils/app_assets.dart';

class SetNewPassView extends StatefulWidget {
  const SetNewPassView({super.key});

  @override
  State<SetNewPassView> createState() => _SetNewPassViewState();
}

class _SetNewPassViewState extends State<SetNewPassView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 67.h),
              Center(child: Image.asset(AppAssets.logoColored)),
              SizedBox(height: 9.h),
              Text(
                'ادخل كلمه المرور الجديده',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10.h),
              Text(
                'قم بانشاء كلمه مرور جديده',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 50.h),
              Text(
                'كلمه المرور',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                labelText: 'Password',
                hintText: 'أدخل كلمة المرور الخاصة بك',
                isPassword: true,
                prefixIcon: Icon(Icons.lock, color: Colors.grey[600]),
              ),

              SizedBox(height: 20.h),
              Text(
                'تاكيد كلمه المرور',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                labelText: 'confirm Password',
                hintText: 'تاكيد كلمه المرور',
                isPassword: true,
                prefixIcon: Icon(Icons.lock, color: Colors.grey[600]),
              ),
              SizedBox(height: 60.h),
              Center(
                child: CustomButton(
                  text: 'تحديث كلمه المرور',
                  onPressed: () {},
                  width: 230.w,
                  height: 40.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
