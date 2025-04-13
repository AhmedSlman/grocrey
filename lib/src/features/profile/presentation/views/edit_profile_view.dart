import 'package:flutter/material.dart';
import 'package:grocery/core/common/widgets/custom_profile_header.dart';
import 'package:grocery/src/features/profile/presentation/component/edit_profile_form.dart';
import 'package:grocery/src/features/profile/presentation/widgets/profiel_picture.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomProfileHeader(header: 'الصفحة الرئيسية'),
          ProfilePicture(image: ''),
          EditProfileForm(),
        ],
      ),
    );
  }
}
