import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/widgets/custom_btn.dart';
import 'package:grocery/core/constants/endpoints_strings.dart';
import 'package:grocery/src/features/home/data/model/product_model.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductModel productDetail;
  const ProductDetailsView({super.key, required this.productDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: AppBar(),
      body: SafeArea(
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
                            child: Image.network(
                              EndpointsStrings.baseUrl +
                                  productDetail.imagePath,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 16.h,
                          //   left: 16.w,
                          right: 18.w,
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: EdgeInsets.all(15.r),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 16.sp,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
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
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.blue.shade700,
                                  size: 20.sp,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                productDetail.name,
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
                            ' الكمية ${productDetail.quantity}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey,
                            ),
                            textDirection: TextDirection.rtl,
                          ),

                          SizedBox(height: 16.h),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Row(
                                  children: [
                                    _quantityButton(Icons.remove, Colors.grey),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                      ),
                                      child: Text(
                                        '1',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    _quantityButton(
                                      Icons.add,
                                      Colors.blue.shade700,
                                    ),
                                  ],
                                ),
                              ),

                              Text(
                                '${productDetail.price} جنيه',
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
                          Text(
                            'Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey,
                              height: 1.5,
                            ),
                          ),

                          Divider(height: 32.h),

                          // Size Selection
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                    child: Text(
                                      productDetail.stockStatus,
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

                          Divider(height: 32.h),

                          // Rating
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  Row(
                                    children: List.generate(
                                      5,
                                      (index) => Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 18.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'التقييم',
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
            CustomButton(text: 'اضف الي السلة', onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget _quantityButton(IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(8.r),
      child: Icon(icon, color: color, size: 20.sp),
    );
  }
}
