import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/constants/endpoints_strings.dart';
import 'package:grocery/core/theme/app_colors.dart';
import 'package:grocery/src/features/cart/presentation/logic/cubit/cart_cubit.dart';
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
    final item = items[index];

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create:
                        (context) => GetcategoriesCubit()..getProducts(item.id),
                  ),
                  BlocProvider(create: (context) => CartCubit()),
                ],
                child: CategoryView(productId: item.id),
              );
            },
          ),
        );
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Hero(
            tag: 'categoryImage_${item.id}',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CachedNetworkImage(
                imageUrl: EndpointsStrings.baseUrl + item.image_path,
                width: 90.w,
                height: 100.h,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) => Container(
                      width: 90.w,
                      height: 100.h,
                      color: Colors.grey.shade300,
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Container(
            width: 90.w,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
            child: Text(
              item.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
