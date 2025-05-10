import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/widgets/search_widget.dart';
import 'package:grocery/src/features/home/presentation/logic/search/cubit/search_cubit.dart';
import 'package:grocery/src/features/home/presentation/widgets/fake_search_widget.dart';
import 'package:grocery/src/features/home/presentation/widgets/home_search_widget.dart';
import 'package:grocery/src/features/home/presentation/widgets/product_card_widget.dart';

class HomeSearchSection extends StatelessWidget {
  HomeSearchSection({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FakeSearchBox();
  }
}
