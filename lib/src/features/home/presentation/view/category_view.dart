import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/constants/endpoints_strings.dart';
import 'package:grocery/core/theme/app_colors.dart';
import 'package:grocery/src/features/home/presentation/logic/categories/getcategories_cubit.dart';
import 'package:grocery/src/features/home/presentation/widgets/product_card_widget.dart';

class CategoryView extends StatelessWidget {
  final int productId;
  const CategoryView({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    //context.read<GetcategoriesCubit>().getProducts(2);

    return BlocBuilder<GetcategoriesCubit, GetcategoriesState>(
      builder: (context, state) {
        return state is GetProductsSuccess
            ? Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.white,
                title: Text(
                  state.categorymodel.name,
                  style: TextStyle(color: AppColors.black),
                ),
                centerTitle: true,
                leading: Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(80),
                  ),

                  child: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.black,
                      size: 15,
                    ),
                  ),
                ),
                actions: [Image.asset('assets/images/edit.png')],
              ),
              body: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  itemCount: state.categorymodel.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    print(
                      '***********************************************************************',
                    );
                    print(
                      EndpointsStrings.baseUrl +
                          state.categorymodel.products[index].imagePath,
                    );
                    return ProductCard(
                      title: state.categorymodel.products[index].name,
                      size: state.categorymodel.products[index].price,
                      currentPrice:
                          state.categorymodel.products[index].discountPrice ??
                          '--',
                      originalPrice: state.categorymodel.products[index].price,
                      imagePath:
                          EndpointsStrings.baseUrl +
                          state.categorymodel.products[index].imagePath,

                      id: state.categorymodel.products[index].id,
                      quantaty:
                          state.categorymodel.products[index].quantity
                              .toString(),
                      stock_status:
                          state.categorymodel.products[index].stockStatus,
                      createdAt:
                          state.categorymodel.products[index].createdAt
                              .toString(),
                      updatedAt:
                          state.categorymodel.products[index].updatedAt
                              .toString(),
                    );
                  },
                ),
              ),
            )
            : Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
