import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final int? maxLines;
  final bool isPassword;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final void Function()? toggleObscure;
 final TextInputType? keyboardType;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.maxLines = 1,
    this.suffixIcon,
    this.fillColor,
    this.prefixIcon,
    this.isPassword = false,
    this.toggleObscure,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 18.0.w,
              horizontal: 12.0.w,
            ),
            hintText: hintText,
            hintStyle: AppStyles.s12.copyWith(
              color: AppColors.grey,
            ),
            fillColor: fillColor ?? AppColors.white,
            filled: true,
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: toggleObscure,
                    icon: Visibility(
                        visible: obscureText,
                        replacement: const Icon(
                          Icons.visibility_outlined,
                        ),
                        child: const Icon(Icons.visibility_off_outlined)),
                    color: AppColors.grey,
                  )
                : suffixIcon,
            prefixIcon: prefixIcon,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(5.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.red),
              borderRadius: BorderRadius.circular(5.0),
            )),
        validator: validator ?? (value) => null,
        maxLines: maxLines,
      ),
    );
  }
}
