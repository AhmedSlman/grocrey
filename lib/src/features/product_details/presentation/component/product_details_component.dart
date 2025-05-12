import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/widgets/pop_icon.dart';
import 'package:grocery/core/constants/endpoints_strings.dart';

import 'package:grocery/src/features/favourite/presentation/logic/cubit/favourite_cubit.dart';
import 'package:grocery/src/features/home/presentation/componant/add_to_cart.dart';
import 'package:grocery/src/features/product_details/presentation/component/quantity_and_price.dart';
import 'package:grocery/src/features/product_details/presentation/logic/product/cubit/product_cubit.dart';
import 'package:grocery/src/features/product_details/presentation/widgets/product_details.dart';
import 'package:grocery/src/features/product_details/presentation/widgets/product_status.dart';
import 'package:grocery/src/features/product_details/presentation/widgets/shimmer_widget.dart';

class ProductDetailsComponent extends StatefulWidget {
  final String productid;

  const ProductDetailsComponent({super.key, required this.productid});

  @override
  State<ProductDetailsComponent> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsComponent> {
  bool? isfavourite;
  String? quanatity;

  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getProduct(widget.productid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is GetProductCartSuccess) {
            isfavourite ??= state.product.product.isFavorite;
            quanatity ??= state.product.product.quantity.toString();

            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 350.h,
                                color: Colors.white,
                                child: Center(
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        EndpointsStrings.baseUrl +
                                        state.product.product.imagePath,
                                    fit: BoxFit.contain,
                                    errorWidget:
                                        (
                                          context,
                                          error,
                                          stackTrace,
                                        ) => Image.network(
                                          'https://ih1.redbubble.net/image.1893341687.8294/fposter,small,wall_texture,product,750x1000.jpg',
                                        ),
                                  ),
                                ),
                              ),
                              const PopIconWidget(),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(16.r),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      child: BlocBuilder<
                                        FavouriteCubit,
                                        FavouriteState
                                      >(
                                        builder: (context, state) {
                                          return IconButton(
                                            onPressed: () {
                                              setState(() {
                                                isfavourite = !isfavourite!;
                                              });

                                              context
                                                  .read<FavouriteCubit>()
                                                  .addToFavourite(
                                                    widget.productid,
                                                  );
                                            },
                                            icon:
                                                isfavourite == true
                                                    ? Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                      size: 20.sp,
                                                    )
                                                    : Icon(
                                                      Icons.favorite_border,
                                                      color:
                                                          Colors.blue.shade700,
                                                      size: 20.sp,
                                                    ),
                                          );
                                        },
                                      ),
                                    ),

                                    const Spacer(),
                                    Text(
                                      state.product.product.name,
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  ' الكمية ${state.product.product.quantity} جرام',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                                QuantityAndPrice(
                                  quanatity,
                                  productid: widget.productid,
                                  id: state.product.product.id.toString(),
                                  price: state.product.product.price.toString(),
                                ),
                                SizedBox(height: 16.h),

                                Divider(height: 32.h),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'تفاصيل الطلب',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                ProductDetails(
                                  createdAt:
                                      state.product.product.createdAt
                                          .toString(),
                                  updatedAt:
                                      state.product.product.updatedAt
                                          .toString(),
                                ),
                                Divider(height: 32.h),
                                ProductStatus(
                                  stockstatus:
                                      state.product.product.stockStatus,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  AddToCart(id: widget.productid),
                ],
              ),
            );
          } else {
            return ProductDetailShimmer();
          }
        },
      ),
    );
  }
}
