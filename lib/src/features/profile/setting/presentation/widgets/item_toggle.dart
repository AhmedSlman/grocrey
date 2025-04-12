import 'package:flutter/material.dart';
import 'package:grocery/core/theme/app_colors.dart';

class ItemToggle extends StatelessWidget {
  final bool isSwitched;
  final ValueChanged<bool> onChanged;
  final String text;

  const ItemToggle({
    super.key,
    required this.isSwitched,
    required this.onChanged,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        Switch(
          thumbColor: WidgetStatePropertyAll(Colors.white),
          activeTrackColor: AppColors.borderGrey,
          value: isSwitched,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
