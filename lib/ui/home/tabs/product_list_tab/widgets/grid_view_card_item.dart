import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_app_e_commerece_online/ui/home/tabs/product_list_tab/cubit/product_list_tab_view_model.dart';
import 'package:flutter_app_e_commerece_online/ui/utils/app_theme.dart';
import 'package:flutter_app_e_commerece_online/ui/utils/my_assets.dart';
import 'package:flutter_app_e_commerece_online/ui/utils/my_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewCardItem extends StatelessWidget {
  bool isWishlisted = false;
  ProductEntity productEntity ;
  GridViewCardItem({required this.productEntity});
  @override
  Widget build(BuildContext context) {

    return Container(
      width: 191.w,
      height: 237.h,
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
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.network(
                  productEntity.imageCover??""
                   ,
                  fit: BoxFit.cover,
                  width: 191.w,
                  height: 128.h,
                ),
              ),
              Positioned(
                top: 5.h,
                right: 2.w,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: IconButton(
                    color: AppColors.primaryColor,
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: isWishlisted == true
                        ? const Icon(Icons.favorite_rounded)
                        : const Icon(
                            Icons.favorite_border_rounded,
                          ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              productEntity.title??"",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 14.sp,
                color: AppColors.darkPrimaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Row(
              children: [
                Text(
                  "EGP ${productEntity.price}",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.darkPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0.w, right: 8.w),
            child: Row(
              children: [
                Text(
                  "Review (${productEntity.ratingsAverage})",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.darkPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 7.w,
                ),
                Image.asset(
                  MyAssets.starIcon,
                ),
                const Spacer(
                  flex: 1,
                ),
                InkWell(
                  onTap: () {
                    ProductListTabViewModel.get(context)
                        .addToCart(productEntity.id??"");
                  },
                  splashColor: Colors.transparent,
                  child: Icon(
                    Icons.add_circle,
                    size: 32.sp,
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ),
          )
          // GridViewCardItemBody(
          //   productEntity: productEntity,
          // )
        ],
      ),
    );
  }
}
