import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_online/ui/utils/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15.h),
          hintText: "What do you search for?",
          hintStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              color: const Color.fromRGBO(6, 0, 79, 0.6)),
          prefixIcon: IconButton(
            icon: Icon(
              Icons.search,
              size: 32.sp,
              color: AppColors.primaryColor.withOpacity(0.75),
            ),
            onPressed: () {},
          ),
          border: buildBaseBorder(),
          enabledBorder: buildBaseBorder(),
          focusedBorder: buildBaseBorder().copyWith(
              borderSide:
                  const BorderSide(color: AppColors.primaryColor, width: 2))),
    );
  }

  OutlineInputBorder buildBaseBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.r),
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
    );
  }
}
