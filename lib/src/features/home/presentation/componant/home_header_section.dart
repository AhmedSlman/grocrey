import 'package:flutter/material.dart';
import 'package:grocery/core/services/location_services.dart';
import 'package:grocery/core/theme/app_colors.dart';
import 'package:grocery/core/utils/app_assets.dart';
import 'package:grocery/core/utils/app_shimmer.dart';

late Future<String> locationFuture;

class HomeHeaderSection extends StatefulWidget {
  const HomeHeaderSection({super.key});

  @override
  State<HomeHeaderSection> createState() => _HomeHeaderSectionState();
}

class _HomeHeaderSectionState extends State<HomeHeaderSection> {
  @override
  void initState() {
    super.initState();
    locationFuture = _getLocation();
  }

  Future<String> _getLocation() async {
    try {
      final position = await LocationService().getCurrentLocation();
      if (position != null) {
        final placeName = await LocationService().getPlaceNameFromPosition(
          position,
        );
        return placeName ?? 'لم يتم العثور على الموقع';
      } else {
        return 'تعذر تحديد الموقع';
      }
    } catch (e) {
      return 'حدث خطأ: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset(AppAssets.logoColored),

          Expanded(
            child: FutureBuilder<String>(
              future: locationFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: AppShimmer(height: 30, width: 120),
                  );
                } else if (snapshot.hasError) {
                  return Text('حدث خطأ: ${snapshot.error}');
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      snapshot.data ?? 'لم يتم تحديد الموقع',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
