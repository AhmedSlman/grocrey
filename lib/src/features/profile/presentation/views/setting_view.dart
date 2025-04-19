import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/app_cubit/app_cubit.dart';
import 'package:grocery/core/common/widgets/custom_profile_header.dart';
import 'package:grocery/core/theme/app_colors.dart';
import 'package:grocery/src/features/profile/presentation/component/show_delete_account_bottom_sheet.dart';
import 'package:grocery/src/features/profile/presentation/widgets/item_toggle.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  bool isDark = true;
  changeTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomProfileHeader(header: 'الاعدادت'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ItemToggle(
              text: 'السماح بالاشعارات',
              isSwitched: true,
              onChanged: (c) {},
            ),
          ),
          Padding(padding: const EdgeInsets.all(8.0), child: Divider()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ItemToggle(
              isSwitched: isDark,
              onChanged: (c) {
                changeTheme();
                context.read<AppCubit>().changeTheme();
              },
              text: 'الوضع المظلم',
            ),
          ),
          Padding(padding: const EdgeInsets.all(8.0), child: Divider()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('لغة التطبيق'),
                Spacer(),

                DropdownButton<String>(
                  value: 'اللغة الانجليزية',
                  underline: Container(),
                  icon: Icon(Icons.keyboard_arrow_down),
                  items:
                      ['اللغة العربية', 'اللغة الانجليزية']
                          .map(
                            (city) => DropdownMenuItem(
                              value: city,
                              child: Text(city),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.all(8.0), child: Divider()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                showDeleteAccountBottomSheet(context);
              },
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'حذف حسابي',
                  style: TextStyle(
                    color: AppColors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
