import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/common/widgets/custom_profile_header.dart';
import 'package:grocery/core/theme/app_colors.dart';
import 'package:grocery/src/features/profile/profile/presentation/view/custom_profile_item.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    const List profileItems = [
      "طلباتى",
      "عنواني",
      "بطاقتي",
      "الاعدادات",
      "معلومات عنا",
      "تسجيل الخروج",
    ];
    const List profileImages = [
      "assets/images/svg_images/cart.svg",
      "assets/images/svg_images/location.svg",
      "assets/images/svg_images/wallet.svg",
      "assets/images/svg_images/setting.svg",
      "assets/images/svg_images/info.svg",
      "assets/images/svg_images/logout.svg",
    ];
    return Scaffold(
      body: Column(
        children: [
          CustomProfileHeader(header: 'البيانات الشخصية'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(radius: 50),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "محمد علي",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text("+201029673915", style: TextStyle(fontSize: 16)),
                  ],
                ),

                const Spacer(),
                InkWell(
                  onTap: () {
                    context.go('/edit_profile');
                  },
                  child: SvgPicture.asset(
                    'assets/images/svg_images/edit.svg',
                    height: 24,
                    width: 24,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 400,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return CustomProfileItem(
                  profileImage: profileImages[index],
                  profileItem: profileItems[index],
                  index: index,
                );
              },
              separatorBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: const Divider(color: Colors.grey, height: 1),
                    ),
                  ],
                );
              },
              itemCount: 6,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
