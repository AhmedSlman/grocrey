import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/src/features/profile/address/presentation/widgets/address_item.dart';

class MainAddresses extends StatelessWidget {
  const MainAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550.h,
      child: ListView.separated(
        shrinkWrap: true,

        itemCount: 5,
        itemBuilder: (c, i) {
          return AddressItem();
        },
        separatorBuilder: (BuildContext context, int index) {
          return Padding(padding: const EdgeInsets.all(10.0), child: Divider());
        },
      ),
    );
  }
}
