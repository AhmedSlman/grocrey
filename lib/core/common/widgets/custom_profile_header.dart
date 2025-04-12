import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/theme/app_colors.dart';

class CustomProfileHeader extends StatelessWidget {
  final String header;
  const CustomProfileHeader({super.key, required this.header});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(height: 30.h),
          Row(
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
              Text(
                header,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
