import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery/core/theme/app_colors.dart';
import 'package:grocery/src/features/profile/presentation/component/change_password_bottom_sheet.dart';

class ChangePasswordTile extends StatelessWidget {
  const ChangePasswordTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showChangePasswordBottomSheet(context),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            const Text(
              "تغيير كلمة المرور",
              style: TextStyle(fontSize: 16, color: AppColors.black),
            ),
            Spacer(),
            SvgPicture.asset(
              'assets/images/svg_images/edit.svg',
              color: AppColors.black,
              width: 20,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
