import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/widgets/pop_icon.dart';
import 'package:grocery/core/constants/endpoints_strings.dart';
import 'package:grocery/core/theme/app_colors.dart';
import 'package:grocery/src/features/cart/presentation/logic/cubit/cart_cubit.dart';
import 'package:grocery/src/features/favourite/presentation/logic/cubit/favourite_cubit.dart';
import 'package:grocery/src/features/home/presentation/componant/add_to_cart.dart';
import 'package:grocery/src/features/home/presentation/logic/product/cubit/product_cubit.dart';

class ProductDetailsView extends StatefulWidget {
  final String productid;

  const ProductDetailsView({super.key, required this.productid});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
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
            if (isfavourite == null) {
              isfavourite = state.product.isFavorite;
            }
            if (quanatity == null) {
              quanatity = state.product.product.quantity.toString();
            }

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
                              PopIconWidget(),
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
                                SizedBox(height: 16.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              // Placeholder for decrease logic
                                            },
                                            icon: Icon(Icons.remove),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 12.w,
                                            ),
                                            child: BlocBuilder<
                                              CartCubit,
                                              CartState
                                            >(
                                              builder: (context, state) {
                                                return Text(
                                                  quanatity!,
                                                  style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                quanatity =
                                                    (int.parse(quanatity!) + 1)
                                                        .toString();
                                              });
                                              context
                                                  .read<CartCubit>()
                                                  .addToCart(
                                                    true,
                                                    widget.productid,
                                                  );
                                            },
                                            icon: Icon(Icons.add),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '${state.product.product.price} جنيه',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue.shade700,
                                      ),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ],
                                ),
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
                                SizedBox(
                                  height: 100.h,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Card(
                                        color: AppColors.lightGrey,
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.access_time,
                                                color: Colors.blue,
                                                size: 30,
                                              ),
                                              SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'تاريخ الإنشاء:',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    state
                                                        .product
                                                        .product
                                                        .createdAt
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black54,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      Card(
                                        color: AppColors.lightGrey,
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.update,
                                                color: Colors.orange,
                                                size: 30,
                                              ),
                                              SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'تاريخ التحديث:',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    state
                                                        .product
                                                        .product
                                                        .updatedAt
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black54,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(height: 32.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(8.r),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.grey.shade300,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.arrow_back_ios,
                                            size: 14.sp,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 12.w,
                                            vertical: 6.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius: BorderRadius.circular(
                                              16.r,
                                            ),
                                          ),
                                          child: Text(
                                            state.product.product.stockStatus,
                                            style: TextStyle(fontSize: 12.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'حالة المنتج',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textDirection: TextDirection.rtl,
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
                  AddToCart(id: widget.productid.toString()),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }
        },
      ),
    );
  }
}
