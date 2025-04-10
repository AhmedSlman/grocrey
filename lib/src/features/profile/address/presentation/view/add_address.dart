import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/core/common/widgets/custom_profile_header.dart';
import 'package:grocery/core/common/widgets/custom_text_form_field.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomProfileHeader(header: 'اضافة عنوان'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(labelText: 'عنوان'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(
                labelText: 'العنوان',
                prefixIcon: Icon(Icons.location_on_outlined),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(labelText: 'رقم المبني'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(labelText: 'رقم الشقة'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(labelText: 'رقم الطابق'),
            ),
            Spacer(),
            CustomButton(text: 'حفظ', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
