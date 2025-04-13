import 'package:flutter/material.dart';
import 'package:grocery/core/common/widgets/custom_profile_header.dart';
import 'package:grocery/src/features/profile/presentation/component/add_address_form.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomProfileHeader(header: 'اضافة عنوان'),
          AddAddressForm(),
        ],
      ),
    );
  }
}
