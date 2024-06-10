import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_online/ui/utils/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldItem extends StatelessWidget {
  String fieldName;
  String hintText;
  Widget? suffixIcon;
  bool isObscure;
  var keyboardType;
  String? Function(String?)? validator;
  TextEditingController controller ;
  TextFieldItem(
      {required this.fieldName,
      required this.hintText,
      this.suffixIcon,
      this.isObscure = false,
      this.validator,
      required this.controller,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          fieldName,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 18.sp),
          textAlign: TextAlign.start,
        ),
        Padding(
          padding: EdgeInsets.only(top: 24.h, bottom: 20.h),
          child: TextFormField(
            decoration: InputDecoration(
                fillColor: AppColors.whiteColor,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r)),
                hintText: hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColors.greyColor),
                suffixIcon: suffixIcon),
            style: const TextStyle(color: AppColors.blackColor),
            validator: validator,
            controller: controller,
            obscureText: isObscure,
            keyboardType: keyboardType,
          ),
        )
      ],
    );
  }
}
