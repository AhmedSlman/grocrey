import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/constants/endpoints_strings.dart';
import 'package:grocery/core/theme/app_colors.dart';
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
        actions: [Image.asset('assets/images/edit.png')],
      ),
      body: BlocBuilder<FavouriteCubit, FavouriteState>(
        builder: (context, state) {
          return state is SuccessGetFavourite
              ? ListView.builder(
                itemCount: state.favourite.favorites.length,
                itemBuilder: (context, index) {
                  return FavouriteItem(
                    favouriteItem: state.favourite.favorites[index],
                  );
                },
              )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class FavouriteItem extends StatelessWidget {
  final FavoriteItem favouriteItem;
  const FavouriteItem({super.key, required this.favouriteItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                EndpointsStrings.baseUrl + favouriteItem.imagePath,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder:
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
                  favouriteItem.quantity.toString(),
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),

            // صورة المشروب
            const Spacer(),
            // اسم المشروب والوصف
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
    );
  }
}
