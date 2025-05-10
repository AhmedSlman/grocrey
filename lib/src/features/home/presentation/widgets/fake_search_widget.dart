import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/src/features/home/presentation/componant/home_search_section.dart';
import 'package:grocery/src/features/home/presentation/componant/search_compenent.dart';
import 'package:grocery/src/features/home/presentation/logic/search/cubit/search_cubit.dart';

class FakeSearchBox extends StatelessWidget {
  final VoidCallback? onTap;

  const FakeSearchBox({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) {
              return BlocProvider(
                create: (context) => SearchCubit(),
                child: SearchComponent(),
              );
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text('ابحث عن منتج...', style: TextStyle(color: Colors.grey)),
      ),
    );
  }
}
