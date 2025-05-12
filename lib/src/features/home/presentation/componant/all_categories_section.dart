import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/utils/app_shimmer.dart';
import 'package:grocery/src/features/home/presentation/logic/categories/getcategories_cubit.dart';
import 'package:grocery/src/features/home/presentation/widgets/category_item_widget.dart';
import 'package:grocery/src/features/home/presentation/widgets/home_section_header.dart';

class AllCategoriesSection extends StatelessWidget {
  const AllCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetcategoriesCubit, GetcategoriesState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HomeSectionHeader(title: 'جميع الفئات'),
              SizedBox(height: 12.h),
              SizedBox(
                height: 100.h,
                child:
                    state is GetcategoriesSuccess
                        ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.categorymodel.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: 12.w),
                              child: CategoryItemWidget(
                                items: state.categorymodel,
                                index: index,
                              ),
                            );
                          },
                        )
                        : state is GetcategoriesFail
                        ? Center(child: Text(state.errorModel.message))
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
