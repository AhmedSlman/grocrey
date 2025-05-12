import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/theme/app_colors.dart';
import 'package:grocery/src/features/profile/presentation/component/exit_modal_bottom_sheet.dart';
import 'package:grocery/src/features/profile/presentation/widgets/custom_profile_item.dart';

class ProfileItems extends StatelessWidget {
  const ProfileItems({super.key});

  @override
  Widget build(BuildContext context) {
    const List profileItems = [
      "طلباتى",
      "بطاقتي",
      "الاعدادات",
      "معلومات عنا",
      "تسجيل الخروج",
    ];
    const List profileImages = [
      "assets/images/svg_images/cart.svg",
      "assets/images/svg_images/wallet.svg",
      "assets/images/svg_images/setting.svg",
      "assets/images/svg_images/info.svg",
      "assets/images/svg_images/logout.svg",
    ];
    const List profilePages = ['/orders', '/carts', '/setting', '/about_info'];
    return SizedBox(
      height: 500.h,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              index == 4
                  ? showExitBottomSheet(context)
                  : context.push(profilePages[index]);
            },
            child: CustomProfileItem(
              profileImage: profileImages[index],
              profileItem: profileItems[index],
              index: index,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Divider(
                  color: AppColors.lightBorderGrey,
                  height: 1,
                ),
              ),
            ],
          );
        },
        itemCount: 5,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
