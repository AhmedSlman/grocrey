import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/services/location_services.dart';
import 'package:grocery/core/utils/app_assets.dart';
import 'package:grocery/core/utils/app_shimmer.dart';
import 'package:grocery/src/features/home/presentation/logic/location/cubit/location_cubit.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: BlocBuilder<LocationCubit, LocationState>(
              builder: (context, state) {
                return state is LoadingGetLocation
                    ? AppShimmer(height: 30, width: 120)
                    : state is SuccessGetLocation
                    ? Text(state.location)
                    : state is FailGetLocation
                    ? Text(state.error)
                    : Container();
              },
            ),

            // FutureBuilder<String>(
            //   future: locationFuture,
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return const Center(
            //         child: AppShimmer(height: 30, width: 120),
            //       );
            //     } else if (snapshot.hasError) {
            //       return Text('حدث خطأ: ${snapshot.error}');
            //     } else {
            //       return Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Text(
            //           snapshot.data ?? 'لم يتم تحديد الموقع',
            //           overflow: TextOverflow.ellipsis,
            //           maxLines: 1,
            //         ),
            //       );
            //     }
            //   },
            // ),
          ),
          SizedBox(width: 8.w),
          Image.asset(AppAssets.logoColored),
        ],
      ),
    );
  }
}
