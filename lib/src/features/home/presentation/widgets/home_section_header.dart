import 'package:flutter/material.dart';

import 'package:grocery/core/utils/app_styles.dart';

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(title, style: AppStyles.s16Alex),
        ),
      ],
    );
  }
}
