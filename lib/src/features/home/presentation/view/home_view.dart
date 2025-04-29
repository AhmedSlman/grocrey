import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:grocery/src/features/home/presentation/componant/all_categories_section.dart';
import 'package:grocery/src/features/home/presentation/componant/bunner_section.dart';
import 'package:grocery/src/features/home/presentation/componant/home_header_section.dart';
import 'package:grocery/src/features/home/presentation/componant/home_search_section.dart';
import 'package:grocery/src/features/home/presentation/componant/offers_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 50.h),

          HomeHeaderSection(),
          SizedBox(height: 12.h),
          HomeSearchSection(),
          SizedBox(height: 12.h),
          BannerSection(),
          SizedBox(height: 12.h),
          AllCategoriesSection(),
          SizedBox(height: 12.h),
          OffersSection(),
        ],
      ),
    );
  }
}
