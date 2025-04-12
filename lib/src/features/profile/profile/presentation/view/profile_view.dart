import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/widgets/custom_profile_header.dart';
import 'package:grocery/src/features/profile/editprofile/presentation/logic/cubit/change_password_cubit.dart';
import 'package:grocery/src/features/profile/profile/presentation/component/profile_items.dart';
import 'package:grocery/src/features/profile/profile/presentation/component/user_info.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomProfileHeader(header: 'البيانات الشخصية'),
          UserInfo(),
          ProfileItems(),
        ],
      ),
    );
  }
}
