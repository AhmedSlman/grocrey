import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/utils/app_assets.dart';

import '../../../../../core/theme/app_colors.dart';

class BannerSection extends StatefulWidget {
  const BannerSection({super.key});

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  final PageController _bannerController = PageController();
  int _currentBannerIndex = 0;

  final List<String> _staticBanners = [
    'https://static.vecteezy.com/system/resources/thumbnails/038/046/770/small_2x/horizontal-sale-banner-template-for-vegetarian-or-organic-product-vector.jpg',
    'https://www.shutterstock.com/image-photo/fresh-healthy-food-vegetables-grocery-260nw-1175684464.jpg',
    'https://www.shutterstock.com/image-photo/banner-different-groceries-food-donations-260nw-1852537183.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: Stack(
        children: [
          PageView.builder(
            controller: _bannerController,
            itemCount: _staticBanners.length,
            onPageChanged: (int index) {
              setState(() {
                _currentBannerIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final imageUrl = _staticBanners[index];
              return Container(
                margin: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9.r),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    memCacheWidth: 400,
                    fit: BoxFit.cover,
                    placeholder:
                        (context, url) => Container(
                          color: AppColors.grey.withOpacity(0.3),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                    errorWidget:
                        (context, url, error) => Container(
                          color: AppColors.grey.withOpacity(0.3),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(9.r),
                            child: Image.asset(
                              AppAssets.banner,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _staticBanners.length,
                (index) => Container(
                  width: 8.w,
                  height: 8.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentBannerIndex == index
                            ? AppColors.primaryColor
                            : AppColors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _bannerController.dispose();
    super.dispose();
  }
}
