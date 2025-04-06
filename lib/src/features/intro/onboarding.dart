import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/core/routes/router_names.dart';
import 'package:grocery/core/utils/app_assets.dart';
import 'package:grocery/core/utils/app_styles.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(AppAssets.onbording1, fit: BoxFit.cover),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(" اهلا بك فى تطبيق البقاله", style: AppStyles.s24Alex),
                  SizedBox(height: 10.h),
                  Text(
                    "احصل على مشترياتك من البقالة خلال ساعة واحدة",
                    style: AppStyles.s14Alex,
                  ),
                  CustomButton(
                    text: "إبدأ",
                    textStyle: AppStyles.s16White,
                    onPressed: () {
                      context.go(RouterNames.login);
                    },
                    height: 60.h,
                    width: 345.w,
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
