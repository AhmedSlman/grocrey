import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery/core/theme/app_colors.dart';

class CustomProfileItem extends StatelessWidget {
  const CustomProfileItem({
    super.key,
    required this.profileItem,
    required this.profileImage,
    required this.index,
  });

  final String profileItem;
  final String profileImage;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          SvgPicture.asset(profileImage),
          const SizedBox(width: 10),
          Text(
            profileItem,
            style: TextStyle(
              fontSize: 18,
              color: index == 5 ? AppColors.red : AppColors.textColor,
            ),
          ),
          const Spacer(),
          Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}
