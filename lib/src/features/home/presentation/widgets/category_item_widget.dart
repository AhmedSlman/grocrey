import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/constants/endpoints_strings.dart';
import 'package:grocery/core/theme/app_colors.dart';

import 'package:grocery/src/features/home/presentation/logic/categories/getcategories_cubit.dart';
import 'package:grocery/src/features/home/presentation/view/category_view.dart';

class CategoryItemWidget extends StatelessWidget {
  final List items;
  final int index;
  const CategoryItemWidget({
    super.key,
    required this.items,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return BlocProvider(
                create:
                    (context) => GetcategoriesCubit()..getProducts(index + 1),
                child: CategoryView(productId: index),
              );
            },
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: 90.w,
            height: 100.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  EndpointsStrings.baseUrl + items[index].image_path,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              items[index].name,
              style: TextStyle(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
