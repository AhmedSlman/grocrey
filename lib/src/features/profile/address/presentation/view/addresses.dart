import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/core/theme/app_colors.dart';

class AddressesView extends StatelessWidget {
  const AddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
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

            SizedBox(
              height: 500.h,
              child: ListView.builder(
                shrinkWrap: true,

                itemCount: 5,
                itemBuilder: (c, i) {
                  return AddressItem();
                },
              ),
            ),
            Spacer(),
            CustomButton(
              text: 'إضافة عنوان جديد',
              onPressed: () {
                context.go('/add_addresses');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AddressItem extends StatelessWidget {
  const AddressItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/images/svg_images/location.svg'),

              SizedBox(width: 8),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'العنوان الحالي',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    'المنصوره،شارع حي الجامعه',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),

          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/images/svg_images/edit.svg',
                  color: AppColors.grey,
                ),
              ),
              SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  showDeleteAddressBottomSheet(context);
                },
                child: SvgPicture.asset('assets/images/svg_images/trash.svg'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void showDeleteAddressBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 134.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: AppColors.borderGrey,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'حذف العنوان',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 12),
            Divider(),
            SizedBox(height: 12),
            Text(
              'هل أنت متأكد أنك تريد حذف هذا العنوان؟',
              style: TextStyle(fontSize: 14, color: AppColors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                    ),
                    child: Text(
                      'نعم، احذف',
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('إلغاء'),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
