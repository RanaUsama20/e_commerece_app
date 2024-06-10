import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_online/ui/home/widgets/item_card.dart';
import 'package:flutter_app_e_commerece_online/ui/utils/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppliancesSection extends StatelessWidget {
  const HomeAppliancesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Home Appliance",
          style: TextStyle(color: AppColors.darkPrimaryColor, fontSize: 18.sp),
        ),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.235,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.5.w),
                  child: const ItemCardHome(),
                );
              }),
        ),
      ],
    );
  }
}
