import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery/src/features/home/presentation/widgets/fake_search_widget.dart';

class HomeSearchSection extends StatelessWidget {
  HomeSearchSection({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FakeSearchBox();
  }
}
