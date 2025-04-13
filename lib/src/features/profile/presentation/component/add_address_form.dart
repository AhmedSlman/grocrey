import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/core/common/widgets/custom_text_form_field.dart';

class AddAddressForm extends StatelessWidget {
  const AddAddressForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      child: ListView(
        children: [
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(text: 'حفظ', onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
