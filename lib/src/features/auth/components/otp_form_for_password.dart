import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/utils/app_assets.dart';
import '../../../../../core/common/widgets/custom_btn.dart';
import '../../../../../core/theme/app_colors.dart';

class OtpFormForPassword extends StatefulWidget {
  const OtpFormForPassword({super.key});

  @override
  State<OtpFormForPassword> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpFormForPassword> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String get _otpCode => _controllers.map((e) => e.text).join();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 67.h),
              Center(child: Image.asset(AppAssets.logoColored)),
              SizedBox(height: 9.h),
              Text(
                'تحقق من بريدك الالكترونى',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10.h),
              Text(
                'ادخال الرمز المكون من 4 ارقام المذكور فى البريد',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 36.h),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.w),
                          child: SizedBox(
                            width: 60.w,
                            height: 80.h,
                            child: TextFormField(
                              controller: _controllers[index],
                              focusNode: _focusNodes[index],
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              maxLength: 1,
                              cursorHeight: 30.h,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: const BorderSide(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                counterText: '..',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: const BorderSide(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                errorStyle: const TextStyle(height: 0),
                              ),
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  if (index < 3) {
                                    FocusScope.of(
                                      context,
                                    ).requestFocus(_focusNodes[index + 1]);
                                  } else {
                                    FocusScope.of(context).unfocus();
                                  }
                                } else if (value.isEmpty && index > 0) {
                                  FocusScope.of(
                                    context,
                                  ).requestFocus(_focusNodes[index - 1]);
                                }
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                            ),
                          ),
                        );
                      }),
                    ),

                    CustomButton(
                      width: 230.w,
                      height: 40.h,
                      onPressed: () {},
                      text: 'تحقق من الرمز',
                    ),

                    SizedBox(height: 12.h),
                    Text.rich(
                      TextSpan(
                        text: 'الم يصلك كود؟',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: ' اعادة ارسال',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryColor,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
