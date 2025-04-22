import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/theme/app_colors.dart';

class OtpFieldsRow extends StatefulWidget {
  const OtpFieldsRow({super.key});

  @override
  OtpFieldsRowState createState() => OtpFieldsRowState();
}

class OtpFieldsRowState extends State<OtpFieldsRow> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  List<String> get otpValues => _controllers.map((e) => e.text).toList();

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    for (var n in _focusNodes) {
      n.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SizedBox(
            width: 40.w,
            height: 80.h,
            child: TextFormField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              cursorHeight: 30.h,
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(),
                counterText: '',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: AppColors.primaryColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: AppColors.primaryColor),
                ),
                errorStyle: const TextStyle(height: 0),
              ),
              onChanged: (value) {
                if (value.isNotEmpty && index < 5) {
                  FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                } else if (value.isEmpty && index > 0) {
                  FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) return '';
                return null;
              },
            ),
          ),
        );
      }),
    );
  }
}
