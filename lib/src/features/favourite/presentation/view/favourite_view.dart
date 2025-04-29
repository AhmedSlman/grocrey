import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery/core/theme/app_colors.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return FavouriteItem();
        },
      ),
    );
  }
}

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({super.key});

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
            // السعر
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '300 جنيه',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.blue.shade900,
                  ),
                ),
              ],
            ),
            const Spacer(),
            // اسم المشروب والوصف
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  'اسبرايت',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text('250 مل', style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(width: 12),
            // صورة المشروب
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://ih1.redbubble.net/image.1893341687.8294/fposter,small,wall_texture,product,750x1000.jpg',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
