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
    context.read<OffersCubit>().getOffers();

    return BlocBuilder<OffersCubit, OffersState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),

          child: Column(
            children: [
              const HomeSectionHeader(title: 'اشهر العروض'),
              SizedBox(height: 12.h),
              SizedBox(
                height: 250.h,
                child:
                    state is GetOffersSuccess
                        ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.offer_producs.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ProductCard(
                              id: state.offer_producs[index].id!,
                              title:
                                  state.offer_producs[index].name ?? 'Unknown',
                              size:
                                  state.offer_producs[index].name ?? 'Unknown',
                              currentPrice:
                                  state.offer_producs[index].price.toString(),
                              originalPrice: '300 جنيه',
                              imagePath:
                                  state.offer_producs[index].imagePath
                                      .toString() ??
                                  '',
                              quantaty:
                                  state.offer_producs[index].quantity
                                      .toString() ??
                                  '',
                              stock_status:
                                  state.offer_producs[index].stockStatus
                                      .toString() ??
                                  '',
                              createdAt:
                                  state.offer_producs[index].createdAt
                                      .toString(),

                              updatedAt:
                                  state.offer_producs[index].updatedAt
                                      .toString(),
                            );
                          },
                        )
                        : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder:
                              (context, index) =>
                                  AppShimmer(width: 90.w, lPadding: 7),
                        ),
              ),
            ],
          ),
        );
      },
    );
  }
}
