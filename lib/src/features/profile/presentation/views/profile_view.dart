import 'package:flutter/material.dart';
import 'package:grocery/core/common/widgets/custom_profile_header.dart';
import 'package:grocery/src/features/profile/presentation/component/profile_items.dart';
import 'package:grocery/src/features/profile/presentation/component/user_info.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomProfileHeader(header: 'البيانات الشخصية', showIcon: false),
          UserInfo(),
          ProfileItems(),
        ],
      ),
    );
  }
}
