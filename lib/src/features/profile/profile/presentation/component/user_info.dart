import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/src/features/profile/profile/presentation/cubit/profile_cubit.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfileData(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    state is SuccessProfileState
                        ? state.profileData.image
                        : 'assets/images/user.png',
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state is SuccessProfileState
                          ? state.profileData.name
                          : "الاسم",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      state is SuccessProfileState
                          ? state.profileData.phone
                          : "...................",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),

                const Spacer(),
                InkWell(
                  onTap: () {
                    context.push('/edit_profile');
                  },
                  child: SvgPicture.asset(
                    'assets/images/svg_images/edit.svg',
                    height: 24,
                    width: 24,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
