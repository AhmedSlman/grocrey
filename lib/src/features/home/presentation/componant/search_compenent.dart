import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/widgets/search_widget.dart';
import 'package:grocery/src/features/home/presentation/logic/search/cubit/search_cubit.dart';
import 'package:grocery/src/features/home/presentation/widgets/product_card_widget.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SearchCubit>().getProducts('');
    return Scaffold(
      body: Column(
        children: [
          SearchWidget(),
          SizedBox(height: 30.h),
          SizedBox(
            height: 600.h,
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                return state is SearchSuccess
                    ? GridView.builder(
                      itemCount: state.products.data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return ProductCard(
                          id: state.products.data[index].id,
                          title: state.products.data[index].name,
                          size: '0',
                          currentPrice: state.products.data[index].price,
                          originalPrice: '0',
                          imagePath: '0',
                          quantaty: '0',
                          stock_status: '0',
                          createdAt: '0',
                          updatedAt: '0',
                        );
                      },
                    )
                    : Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
