import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/constants/endpoints_strings.dart';
import 'package:grocery/core/routes/router_names.dart';
import 'package:grocery/core/theme/app_colors.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/src/features/cart/presentation/logic/cubit/cart_cubit.dart';
import 'package:grocery/src/features/home/data/model/product_model.dart';

class ProductCard extends StatelessWidget {
  final int id;
  final String title;
  final String size;
  final String currentPrice;
  final String originalPrice;
  final String imagePath;
  final String quantaty;
  final String stock_status;

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

    this.productsDetails,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  Widget build(BuildContext context) {
    // context.read<OffersCubit>().getOffers();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          context.push('${RouterNames.productDetails}/$id');
        },

        child: Container(
          width: 200.w,
          //height: 300.h,
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
                            fit: BoxFit.fill,
                            height: 80.h,
                            width: 80.w,
                          ),
                      imageUrl: EndpointsStrings.baseUrl + imagePath,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Column(
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
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocBuilder<CartCubit, CartState>(
                          builder: (context, state) {
                            return InkWell(
                              onTap: () {
                                context.read<CartCubit>().addToCart(
                                  false,
                                  id.toString(),
                                );
                              },
                              child: Container(
                                width: 35.r,
                                height: 35.r,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF0A6986),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20.r,
                                ),
                              ),
                            );
                          },
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
