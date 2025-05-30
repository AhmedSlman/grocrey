import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/core/routes/router_names.dart';
import 'package:grocery/core/utils/app_assets.dart';
import 'package:grocery/src/features/auth/otpFormForPassword/presentation/widgets/otp_fields_row.dart';
import 'package:grocery/src/features/auth/otpFormForPassword/presentation/widgets/resend_code_text.dart';

class OtpFormForPasswordComponent extends StatefulWidget {
  const OtpFormForPasswordComponent({super.key});

  @override
  State<OtpFormForPasswordComponent> createState() =>
      _OtpFormForPasswordComponentState();
}

final GlobalKey<OtpFieldsRowState> otpFieldsRowKey =
    GlobalKey<OtpFieldsRowState>();

class _OtpFormForPasswordComponentState
    extends State<OtpFormForPasswordComponent> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data = GoRouterState.of(context).extra as Map<String, dynamic>;
    final String email = data['email'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 67.h),
        Center(child: Image.asset(AppAssets.logoColored)),
        SizedBox(height: 9.h),
        Text(
          'تحقق من بريدك الالكتروني',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 10.h),
        Text(
          'ادخل كود التحقق المرسل لك على بريدك الالكتروني',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 36.h),
        OtpFieldsRow(key: otpFieldsRowKey),
        SizedBox(height: 20.h),
        Center(
          child: Column(
            children: [
              CustomButton(
                text: "تحقق من الرمز",
                onPressed: () {
                  final otp = otpFieldsRowKey.currentState?.otpValues.join() ?? '';
                  if (otp.length != 6) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('من فضلك أدخل كود مكون من 6 أرقام')),
                    );
                    return;
                  }

                  context.go(
                    RouterNames.setAnewPassword,
                    extra: {'email': email, 'otp': otp},
                  );
                },
                height: 40.h,
                width: 230.w,
              ),
              SizedBox(height: 12.h),
              const ResendCodeText(),
            ],
          ),
        )
      ],
    );
  }
}
