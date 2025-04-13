import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery/core/theme/app_colors.dart';
import 'package:grocery/src/features/profile/presentation/component/show_delete_bottom_sheet.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
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
