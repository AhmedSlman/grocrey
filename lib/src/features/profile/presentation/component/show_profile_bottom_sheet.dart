import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/theme/app_colors.dart';
import 'package:grocery/src/features/profile/presentation/widgets/edit_item.dart';

void showProfilePictureBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.primaryColor,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(color: AppColors.white),
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
            SizedBox(height: 20),
            Text(
              'صورة الملف الشخصي',

              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EditImageItem(
                  icon: Icons.camera_alt_outlined,
                  label: 'كاميرا',
                  onTap: () {},
                ),
                SizedBox(width: 30),
                EditImageItem(
                  icon: Icons.photo_library_outlined,
                  label: 'المعرض',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
