import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_app_e_commerece_online/ui/home/tabs/home_tab/widgets/category_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CategoriesOrBrandsSection extends StatelessWidget {
  List<CategoryOrBrandEntity> list ;
  CategoriesOrBrandsSection({required this.list});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: GridView.builder(
          itemCount: list.length ,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryOrBrandItem(categoryOrBrandEntity: list[index],);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          )),
    );
  }
}
