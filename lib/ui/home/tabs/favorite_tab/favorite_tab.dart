import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_online/ui/home/tabs/home_tab/widgets/custom_search_with_shopping_cart.dart';
import 'package:flutter_app_e_commerece_online/ui/utils/my_assets.dart';
import 'package:flutter_app_e_commerece_online/ui/utils/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Image.asset(
              MyAssets.logo,
              color: AppColors.primaryColor,
            ),
            SizedBox(
              height: 18.h,
            ),
            const CustomSearchWithShoppingCart(),
            SizedBox(
              height: 24.h,
            ),
          ]),
    ));
  }
}
