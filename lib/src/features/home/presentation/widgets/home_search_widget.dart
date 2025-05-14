import 'package:flutter/material.dart';
import 'package:grocery/core/common/widgets/custom_text_form_field.dart';
import 'package:grocery/core/theme/app_colors.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({
    super.key,
    required this.searchController,
    this.onchanged,
  });
  final TextEditingController searchController;
  final void Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomTextFormField(
        controller: searchController,
        labelText: "ابحث عن منتج",
        prefixIcon: Icon(Icons.search_rounded, color: AppColors.iconColor),
        suffixIcon: Icon(Icons.filter_alt, color: AppColors.iconColor),
        fillColor: AppColors.fillGrey,
        hintText: "ابحث عما تريد",
        onchanged: onchanged,
      ),
    );
  }
}
