import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery/core/theme/app_colors.dart';
import 'package:grocery/src/features/profile/presentation/component/show_profile_bottom_sheet.dart';
import 'package:grocery/src/features/profile/presentation/logic/profile_cubit/profile_cubit.dart';

class ProfilePicture extends StatelessWidget {
  final String image;

  const ProfilePicture({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    return Container(
                      width: 120.w,
                      height: 120.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[200],
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            'https://example.com/profile.jpg',
                          ),

                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),

                InkWell(
                  onTap: () => showProfilePictureBottomSheet(context),
                  child: CircleAvatar(
                    radius: 20,

                    backgroundColor: AppColors.primaryColor,
                    child: SvgPicture.asset(
                      'assets/images/svg_images/edit.svg',
                      color: Colors.white,
                      width: 18.w,
                      height: 18.h,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
