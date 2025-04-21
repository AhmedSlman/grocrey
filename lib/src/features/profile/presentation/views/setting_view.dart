import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/app_cubit/app_cubit.dart';
import 'package:grocery/core/common/widgets/custom_profile_header.dart';
import 'package:grocery/core/data/cached/cache_helper.dart';
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

  @override
  void initState() {
    super.initState();
    isDark = getCachedMode();
  }

  void changeTheme() {
    setState(() {
      isDark = !isDark;
      CacheHelper.saveData(key: 'theme', value: isDark ? 'dark' : 'light');
      context.read<AppCubit>().changeTheme();
    });
  }

  bool getCachedMode() {
    String theme = CacheHelper.getData(key: 'theme') ?? 'light';
    return theme == 'dark';
  }

  String getLanguageLabel(String code) {
    switch (code) {
      case 'en':
        return 'اللغة الانجليزية';
      case 'ar':
      default:
        return 'اللغة العربية';
    }
  }

  String getLanguageCode(String label) {
    switch (label) {
      case 'اللغة الانجليزية':
        return 'en';
      case 'اللغة العربية':
      default:
        return 'ar';
    }
  }

  @override
  Widget build(BuildContext context) {
    String currentLangCode = context.locale.languageCode;
    String currentLangLabel = getLanguageLabel(currentLangCode);

    return Scaffold(
      body: ListView(
        children: [
          CustomProfileHeader(header: 'الاعدادت'.tr()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ItemToggle(
              text: 'السماح بالاشعارات'.tr(),
              isSwitched: true,
              onChanged: (c) {},
            ),
          ),
          Padding(padding: const EdgeInsets.all(8.0), child: Divider()),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ItemToggle(
              isSwitched: isDark,
              onChanged: (c) => changeTheme(),
              text: 'الوضع المظلم'.tr(),
            ),
          ),
          Padding(padding: const EdgeInsets.all(8.0), child: Divider()),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('لغة التطبيق'.tr()),
                Spacer(),
                DropdownButton<String>(
                  value: currentLangLabel,
                  underline: Container(),
                  icon: Icon(Icons.keyboard_arrow_down),
                  items:
                      ['اللغة العربية', 'اللغة الانجليزية']
                          .map(
                            (lang) => DropdownMenuItem(
                              value: lang,
                              child: Text(lang),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      String langCode = getLanguageCode(value);
                      context.setLocale(Locale(langCode)).then((_) {
                        CacheHelper.saveData(key: 'language', value: langCode);
                        context.read<AppCubit>().changeLanguage(langCode);
                        setState(() {});
                      });
                    }
                  },
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
                  'حذف حسابي'.tr(),
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
