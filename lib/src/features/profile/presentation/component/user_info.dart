import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/src/features/profile/presentation/logic/profile_cubit/profile_cubit.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Row(
            children: [
              CircleAvatar(
                radius: 50,

                backgroundImage: CachedNetworkImageProvider(
                  state is SuccessProfileState
                      ? state.profileData.image
                      : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
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
    );
  }
}
