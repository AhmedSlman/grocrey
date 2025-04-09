import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_assets.dart';
import 'package:grocery/core/utils/app_styles.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key, required this.location});
  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.logoColored),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on, color: AppStyles.s12Alex.color),
            Text(location, style: AppStyles.s12Alex),
          ],
        ),
      ],
    );
  }
}
