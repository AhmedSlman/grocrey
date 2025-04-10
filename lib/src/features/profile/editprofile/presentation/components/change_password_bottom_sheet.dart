import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/core/common/widgets/custom_text_form_field.dart';
import 'package:grocery/core/theme/app_colors.dart';

void showChangePasswordBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.primaryColor,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 134.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: AppColors.borderGrey,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'تغيير كلمة المرور',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                labelText: 'كلمة المرور الحالية',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove_red_eye_outlined),
                ),
              ),

              SizedBox(height: 12.h),
              CustomTextFormField(labelText: 'كلمة المرور الجديدة'),
              SizedBox(height: 12.h),
              CustomTextFormField(labelText: 'تأكيد كلمة المرور'),
              SizedBox(height: 15.h),
              CustomButton(text: 'حفظ', onPressed: () {}),
            ],
          ),
        ),
      );
    },
  );
}
