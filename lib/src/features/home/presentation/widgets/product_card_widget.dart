import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/constants/endpoints_strings.dart';
import 'package:grocery/core/theme/app_colors.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/src/features/cart/presentation/logic/cubit/cart_cubit.dart';
import 'package:grocery/src/features/favourite/presentation/logic/cubit/favourite_cubit.dart';
import 'package:grocery/src/features/home/data/model/category_model_detail.dart';
import 'package:grocery/src/features/home/presentation/logic/product/cubit/product_cubit.dart';
import 'package:grocery/src/features/home/presentation/view/product_details_view.dart';

class ProductCard extends StatelessWidget {
  final int id;
  final String title;
  final String size;
  final String currentPrice;
  final String originalPrice;
  final String imagePath;
  final String quantaty;
  final String stock_status;

  final VoidCallback? onAddPressed;
  final ProductModel? productsDetails;
  final String createdAt;
  final String updatedAt;

  const ProductCard({
    super.key,
    required this.id,
    required this.title,
    required this.size,
    required this.currentPrice,
    required this.originalPrice,
    required this.imagePath,
    required this.quantaty,
    required this.stock_status,

    this.onAddPressed,
    this.productsDetails,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          //context.go(ProductDetailsView());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (c) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (context) => FavouriteCubit()),
                    BlocProvider(create: (context) => ProductCubit()),

                    BlocProvider(
                      create: (context) => CartCubit()..getFromCart(),
                    ),
                  ],
                  child: ProductDetailsView(productid: id.toString()),
                );
              },
            ),
          );
        },

        child: Container(
          width: 200.w,
          height: 230.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.lightBorderGrey, width: 1),
          ),
          child: Padding(
            padding: EdgeInsets.all(2.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: Center(
                    child: CachedNetworkImage(
                      height: 60.h,
                      fit: BoxFit.contain,
                      errorWidget:
                          (context, error, stackTrace) => Image.network(
                            'https://ih1.redbubble.net/image.1893341687.8294/fposter,small,wall_texture,product,750x1000.jpg',
                            fit: BoxFit.cover,
                            height: 80.h,
                            width: 80.w,
                          ),
                      imageUrl: EndpointsStrings.baseUrl + imagePath,
                    ),
                  ),
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: AppStyles.s12Alex.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 3.h),
                          Text(
                            size,
                            style: AppStyles.s12Alex.copyWith(
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: onAddPressed,
                            child: Container(
                              width: 32.r,
                              height: 32.r,
                              decoration: const BoxDecoration(
                                color: Color(0xFF0A6986),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 18.r,
                              ),
                            ),
                          ),

                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: Text(
                                    originalPrice,
                                    style: AppStyles.s12Alex.copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 10.sp,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(width: 3.w),
                                Text(
                                  currentPrice,
                                  style: AppStyles.s12Alex.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
