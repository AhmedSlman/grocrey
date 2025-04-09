import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/routes/router_names.dart';

class DontHaveAnAcountWidget extends StatelessWidget {
  const DontHaveAnAcountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          text: "الا تمتلك حساب؟",
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xff8E8EA9),
          ),
          children: [
            TextSpan(
              text: " انشاء حساب",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xff34344A),
              ),
              recognizer:
                  TapGestureRecognizer()
                    ..onTap = () {
                      context.go(RouterNames.register);
                    },
            ),
          ],
        ),
      ),
    );
  }
}
