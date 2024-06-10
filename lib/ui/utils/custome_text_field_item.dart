import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_online/ui/utils/my_assets.dart';
import 'package:flutter_app_e_commerece_online/ui/utils/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFieldItem extends StatelessWidget {
  String fieldName;
  String hintText;
  Widget? suffixIcon;
  bool isObscure;
  var keyboardType;
  void Function()? suffixIconFunction;
  String? Function(String?)? validator;
  TextEditingController controller ;
  CustomTextFieldItem(
      {required this.fieldName,
      required this.hintText,
      this.suffixIcon,
      this.isObscure = false,
      this.validator,
      required this.controller,
      required this.suffixIconFunction,
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
              .copyWith(fontSize: 18.sp,color: AppColors.primaryColor),
          textAlign: TextAlign.start,
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.h, bottom: 20.h),
          child: TextFormField(
            decoration: InputDecoration(
                fillColor: AppColors.whiteColor,
                filled: true,
                suffixIcon: InkWell(
                  onTap: suffixIconFunction,
                    child: ImageIcon(AssetImage(MyAssets.editIcon))),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.blueGreyColor
                  ),
                    borderRadius: BorderRadius.circular(15.r)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.blueGreyColor
                    ),
                    borderRadius: BorderRadius.circular(15.r)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.blueGreyColor
                    ),
                    borderRadius: BorderRadius.circular(15.r)),
                hintText: hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColors.greyColor),
                ),
            style: TextStyle(color: AppColors.blackColor),
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
