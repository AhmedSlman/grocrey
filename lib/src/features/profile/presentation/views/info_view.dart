import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery/core/common/widgets/custom_profile_header.dart';
import 'package:grocery/core/utils/app_assets.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomProfileHeader(header: 'معلومات عنا'),
          Image.asset(AppAssets.logoColored),
          Text('قصتنا', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(
            '--------------------------------------------------------------------',
          ),

          Text('معلومات عنا', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(
            '--------------------------------------------------------------------',
          ),
        ],
      ),
    );
  }
}
