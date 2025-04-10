import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/core/common/widgets/custom_text_form_field.dart';
import 'package:grocery/core/theme/app_colors.dart';
import 'package:grocery/src/features/profile/editprofile/presentation/components/resend_text_row.dart';
import 'package:grocery/src/features/profile/editprofile/presentation/widgets/change_password.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFormField(labelText: 'اسمك', hintText: 'محمد علي'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.borderGrey),
                  ),
                  child: CountryCodePicker(
                    initialSelection: 'EG',
                    onChanged: (code) {
                      print(code.dialCode);
                    },
                  ),
                ),
                Expanded(
                  child: CustomTextFormField(
                    labelText: 'رقم التليفون',
                    hintText: '01029673915',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFormField(
              labelText: 'رمز التأكيد',
              hintText: 'رمز التأكيد',
              suffixIcon: TextButton(
                onPressed: () {},
                child: Text(
                  'تأكيد',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
            ),
          ),
          ResendTextRow(),
          CustomButton(text: 'حفظ', onPressed: () {}),

          ChangePasswordTile(),
        ],
      ),
    );
  }
}
