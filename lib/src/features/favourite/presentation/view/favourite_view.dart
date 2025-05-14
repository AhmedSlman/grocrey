import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/constants/endpoints_strings.dart';
import 'package:grocery/core/routes/router_names.dart';
import 'package:grocery/core/theme/app_colors.dart';
import 'package:grocery/core/utils/app_shimmer.dart';
import 'package:grocery/src/features/favourite/data/model/favourite_model.dart';
import 'package:grocery/src/features/favourite/presentation/logic/cubit/favourite_cubit.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FavouriteCubit>().getFavourite();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text('المفضلة', style: TextStyle(color: AppColors.black)),
        centerTitle: true,

        // leading: Container(
        //   decoration: BoxDecoration(
        //     color: AppColors.lightGrey,
        //     borderRadius: BorderRadius.circular(80),
        //   ),

        //   child: IconButton(
        //     onPressed: () {
        //       context.pop();
        //     },
        //     icon: Icon(
        //       Icons.arrow_back_ios,
        //       color: AppColors.black,
        //       size: 15,
        //     ),
        //   ),
        // ),
        //  actions: [Image.asset('assets/images/edit.png')],
      ),
      body: BlocBuilder<FavouriteCubit, FavouriteState>(
        builder: (context, state) {
          return state is FailGetFavourite
              ? Center(
                child: Text(
                  state.message,
                  style: TextStyle(color: AppColors.red),
                ),
              )
              : state is SuccessGetFavourite
              ? state.favourite.favorites.isNotEmpty
                  ? ListView.builder(
                    itemCount: state.favourite.favorites.length,
                    itemBuilder: (context, index) {
                      return FavouriteItem(
                        favouriteItem: state.favourite.favorites[index],
                      );
                    },
                  )
                  : Center(child: Text('لا توجد عناصر مفضلة'))
              : ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppShimmer(height: 80.h),
                    ),
                  );
                },
              );
        },
      ),
    );
  }
}

class FavouriteItem extends StatelessWidget {
  final FavoriteModel favouriteItem;
  const FavouriteItem({super.key, required this.favouriteItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('${RouterNames.productDetails}/${favouriteItem.id}');

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (c) {
        //       return MultiBlocProvider(
        //         providers: [
        //           BlocProvider(create: (context) => CartCubit()),
        //           BlocProvider(create: (context) => ProductCubit()),
        //         ],
        //         child: ProductDetailsView(
        //           productid: favouriteItem.id.toString(),
        //           // productName: favouriteItem.name,
        //           // productImage: favouriteItem.imagePath,
        //           // productPrice: favouriteItem.price,
        //           // productQuantity: favouriteItem.price,
        //           // productStockStatus: favouriteItem.stockStatus,
        //           // productCreatedAt: '',
        //           // productUpdatedAt: '',
        //         ),
        //       );
        //     },
        //   ),
        // );
      },
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: EndpointsStrings.baseUrl + favouriteItem.imagePath,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorWidget:
                      (context, error, stackTrace) => Image.network(
                        'https://ih1.redbubble.net/image.1893341687.8294/fposter,small,wall_texture,product,750x1000.jpg',
                      ),
                ),
              ),
              // السعر
              const SizedBox(width: 12),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    favouriteItem.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'الكمية : ${favouriteItem.quantity}',

                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),

              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    favouriteItem.price.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.blue.shade900,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
