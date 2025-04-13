import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/core/theme/app_colors.dart';
import 'package:grocery/src/features/profile/presentation/component/main_addressrs.dart';

class AddressesView extends StatelessWidget {
  const AddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 30.h),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop(context);
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.lightGrey,
                    child: Icon(Icons.arrow_back_ios_outlined),
                  ),
                ),
                SizedBox(width: 10),
                const Text(
                  "العناوين الرئيسية",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          MainAddresses(),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              text: 'إضافة عنوان جديد',
              onPressed: () {
                context.push('/add_addresses');
              },
            ),
          ),
        ],
      ),
    );
  }
}
