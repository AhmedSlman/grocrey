import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/widgets/pop_icon.dart';
import 'package:grocery/core/constants/endpoints_strings.dart';
import 'package:grocery/core/data/cached/cache_helper.dart';
import 'package:grocery/core/theme/app_colors.dart';
import 'package:grocery/src/features/cart/presentation/logic/cubit/cart_cubit.dart';
import 'package:grocery/src/features/favourite/presentation/logic/cubit/favourite_cubit.dart';
import 'package:grocery/src/features/home/presentation/componant/add_to_cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailsView extends StatefulWidget {
  final String productid;
  final String productName;
  final String productImage;
  final String productPrice;
  final String productQuantity;
  final String productStockStatus;
  final String productCreatedAt;
  final String productUpdatedAt;

  const ProductDetailsView({
    super.key,
    required this.productid,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productQuantity,
    required this.productStockStatus,
    required this.productCreatedAt,
    required this.productUpdatedAt,
  });

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  bool isFavourite = false;

  @override
  void initState() {
    super.initState();
    loadFavorite();
  }

  Future<void> loadFavorite() async {
    print('🔄 Loading Favorite...');
    final result = await CacheHelper.getData(
      key: 'favourite_${widget.productid}',
    );

    if (result != null && result is bool) {
      setState(() {
        isFavourite = result;
        print('✅ isFavourite: $isFavourite');
      });
    } else {
      print('❗ No saved favourite state');
    }
  }

  Future<void> toggleFavourite() async {
    setState(() {
      isFavourite = !isFavourite;
    });

    final success = await CacheHelper.saveData(
      key: 'favourite_${widget.productid}',
      value: isFavourite,
    );

    print('✅ Saved: $success');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
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
                                      widget.productImage,
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
                                    child: IconButton(
                                      onPressed: () {
                                        context
                                            .read<FavouriteCubit>()
                                            .addToFavourite(widget.productid);
                                        print(
                                          '======================================================================',
                                        );
                                        toggleFavourite();
                                      },
                                      icon:
                                          isFavourite
                                              ? Icon(
                                                Icons.favorite,
                                                color: Colors.red,

                                                size: 20.sp,
                                              )
                                              : Icon(
                                                Icons.favorite_border,
                                                color: Colors.blue.shade700,

                                                size: 20.sp,
                                              ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    widget.productName,
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
                                ' الكمية ${widget.productQuantity} جرام',
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
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            // context.read<CartCubit>().addToCart();
                                            //print(productDetail.id);
                                            //  print(cart[0].productId);

                                            // final int quantity =
                                            //     cart
                                            //         .firstWhere(
                                            //           (item) =>
                                            //               item.productId ==
                                            //               productDetail.id,
                                            //         )
                                            //         .quantity;
                                            // print(quantity.toString());

                                            // context.read<CartCubit>().getQuantity(
                                            //   productDetail.id,
                                            // );
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
                                                context
                                                    .read<CartCubit>()
                                                    .quantity
                                                    .toString(),
                                                //  productDetail.quantity.toString(),
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
                                            context.read<CartCubit>().addToCart(
                                              true,
                                              protected.toString(),
                                            );
                                          },
                                          icon: Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Text(
                                    '${widget.productPrice} جنيه',
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

                              // Product Description
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
                                  shrinkWrap: true,
                                  //   physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Card(
                                      color: AppColors.lightGrey,
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
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
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  widget.productCreatedAt ?? '',
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
                                    SizedBox(height: 20),

                                    // Card لعرض تاريخ التحديث
                                    Card(
                                      color: AppColors.lightGrey,
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
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
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  widget.productUpdatedAt ?? '',
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
                                          widget.productStockStatus,
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
        },
      ),
    );
  }
}
