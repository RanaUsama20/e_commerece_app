import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_online/ui/home/widgets/item_card_body.dart';
import 'package:flutter_app_e_commerece_online/ui/home/widgets/item_card_header.dart';
import 'package:flutter_app_e_commerece_online/ui/utils/my_assets.dart';
import 'package:flutter_app_e_commerece_online/ui/utils/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCardHome extends StatelessWidget {
  const ItemCardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemCardHeader(image: MyAssets.itemImage, isWishlisted: false),
          SizedBox(
            height: 7.h,
          ),
          HomeCardItemBody()
        ],
      ),
    );
  }
}
