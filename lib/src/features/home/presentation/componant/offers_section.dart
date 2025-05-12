import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/utils/app_shimmer.dart';
import 'package:grocery/src/features/home/presentation/logic/offers/cubit/offers_cubit.dart';
import 'package:grocery/src/features/home/presentation/widgets/home_section_header.dart';
import 'package:grocery/src/features/home/presentation/widgets/product_card_widget.dart';

class OffersSection extends StatelessWidget {
  const OffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (context, state) {
        Widget content;

        if (state is GetOffersSuccess) {
          final products = state.offer_producs;

          content = ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (context, index) => SizedBox(width: 10.w),
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                id: product.id!,
                title: product.name ?? 'Unknown',
                size: product.name ?? 'Unknown',
                currentPrice: product.price.toString(),
                originalPrice: '300 جنيه',
                imagePath: product.imagePath ?? '',
                quantaty: product.quantity.toString(),
                stock_status: product.stockStatus.toString(),
                createdAt: product.createdAt.toString(),
                updatedAt: product.updatedAt.toString(),
              );
            },
          );
        } else if (state is GetOffersFail) {
          content = Center(
            child: Text(
              state.errorModel.message,
              style: TextStyle(color: Colors.red, fontSize: 16.sp),
            ),
          );
        } else {
          content = ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            separatorBuilder: (context, index) => SizedBox(width: 10.w),
            itemBuilder:
                (context, index) => const AppShimmer(width: 90, lPadding: 7),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeSectionHeader(title: 'اشهر العروض'),
              SizedBox(height: 12.h),
              SizedBox(height: 200.h, child: content),
            ],
          ),
        );
      },
    );
  }
}
