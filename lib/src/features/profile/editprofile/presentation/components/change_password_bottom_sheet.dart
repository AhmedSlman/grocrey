import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/functions/validator.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/core/common/widgets/custom_text_form_field.dart';
import 'package:grocery/core/theme/app_colors.dart';
import 'package:grocery/src/features/profile/editprofile/presentation/logic/cubit/change_password_cubit.dart';

void showChangePasswordBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: AppColors.primaryColor,
    builder: (context) {
      return BlocProvider(
        create: (context) => ChangePasswordCubit(),
        child: Builder(
          builder: (context) {
            var cubit = context.read<ChangePasswordCubit>();

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
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.formKey,
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
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                          builder: (context, state) {
                            return CustomTextFormField(
                              isPassword: true,
                              obscureText: cubit.isObscure,

                              controller: cubit.currentPassword,
                              labelText: 'كلمة المرور الحالية',
                              toggleObscure: cubit.toggleObscurePassword,
                              validator: (value) {
                                return Validator.validatePassword(value);
                              },
                            );
                          },
                        ),

                        SizedBox(height: 12.h),
                        CustomTextFormField(
                          controller: cubit.newPassword,
                          labelText: 'كلمة المرور الجديدة',
                          validator: (value) {
                            return Validator.validatePassword(value);
                          },
                        ),
                        SizedBox(height: 12.h),
                        CustomTextFormField(
                          controller: cubit.confirmNewPassword,
                          labelText: 'تأكيد كلمة المرور',
                          validator: (value) {
                            return Validator.validatePassword(value);
                          },
                        ),
                        SizedBox(height: 15.h),
                        BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
                          builder: (context, state) {
                            return state is LoadingChangePassword
                                ? CircularProgressIndicator()
                                : CustomButton(
                                  text: 'حفظ',
                                  onPressed: () {
                                    cubit.changePassword();
                                  },
                                );
                          },
                          listener: (
                            BuildContext context,
                            ChangePasswordState state,
                          ) {
                            if (state is FailChangePassword) {
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.message)),
                              );
                            } else {}
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
