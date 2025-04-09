import 'package:flutter/widgets.dart';
import 'package:grocery/src/features/home/presentation/widgets/home_header_widget.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeHeaderWidget(location: 'المنصوره, القاهره');
  }
}
