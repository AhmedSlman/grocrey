import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/common/functions/validator.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/core/common/widgets/custom_text_form_field.dart';
import 'package:grocery/src/features/profile/presentation/logic/profile_cubit/profile_cubit.dart';
import 'package:grocery/src/features/profile/presentation/widgets/change_password.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          state is FailProfileState
              ? ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error)))
              : state is SuccessUpdateProfile
              ? ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Success Update Data')))
              : Container();
        },
        builder: (context, state) {
          var cubit = context.read<ProfileCubit>();
          return Form(
            key: cubit.formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                    labelText: 'اسمك',
                    hintText: 'محمد علي',
                    controller: cubit.nameController,
                    validator: (value) {
                      return Validator.validateName(value);
                    },
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     children: [
                //       Container(
                //         margin: EdgeInsets.only(left: 8),
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           border: Border.all(color: AppColors.borderGrey),
                //         ),
                //         child: CountryCodePicker(
                //           initialSelection: 'EG',
                //           onChanged: (code) {
                //             print(code.dialCode);
                //           },
                //         ),
                //       ),
                //       Expanded(
                //         child: CustomTextFormField(
                //           labelText: 'رقم التليفون',
                //           hintText: '01029673915',
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: CustomTextFormField(
                //     labelText: 'رمز التأكيد',
                //     hintText: 'رمز التأكيد',
                //     suffixIcon: TextButton(
                //       onPressed: () {},
                //       child: Text(
                //         'تأكيد',
                //         style: TextStyle(color: AppColors.primaryColor),
                //       ),
                //     ),
                //   ),
                // ),
                // ResendTextRow(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                    labelText: 'ايميلك',
                    hintText: 'waleedsefan@gmail.com',
                    controller: cubit.emailController,
                    validator: (value) {
                      return Validator.validateEmail(value);
                    },
                  ),
                ),
                state is LoadingUpdateProfileState
                    ? CircularProgressIndicator()
                    : CustomButton(
                      text: 'حفظ',
                      onPressed: () {
                        cubit.updateProfile();
                      },
                    ),

                ChangePasswordTile(),
              ],
            ),
          );
        },
      ),
    );
  }
}
