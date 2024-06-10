import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_online/domain/di.dart';
import 'package:flutter_app_e_commerece_online/ui/home/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter_app_e_commerece_online/ui/home/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:flutter_app_e_commerece_online/ui/home/tabs/home_tab/widgets/annountcements_section.dart';
import 'package:flutter_app_e_commerece_online/ui/home/tabs/home_tab/widgets/categories_or_brands_section.dart';
import 'package:flutter_app_e_commerece_online/ui/home/tabs/home_tab/widgets/custom_search_with_shopping_cart.dart';
import 'package:flutter_app_e_commerece_online/ui/home/tabs/home_tab/widgets/row_section_widgets.dart';
import 'package:flutter_app_e_commerece_online/ui/utils/my_assets.dart';
import 'package:flutter_app_e_commerece_online/ui/utils/my_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  HomeTabViewModel viewModel = HomeTabViewModel(
      getAllCategoriesUseCase: injectGetAllCategoriesUseCase(),
      getAllBrandsUseCase: injectGetAllBrandsUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabViewModel,HomeTabStates>(
        bloc: viewModel
          ..getCategories()
          ..getBrands(),
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
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
                      height: 16.h,
                    ),
                    AnnouncementsSection(),
                    SizedBox(
                      height: 16.h,
                    ),
                    RowSectionWidget(name: 'Categories'),
                    SizedBox(
                      height: 24.h,
                    ),
                    state is HomeTabCategoryLoadingStates
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                        :
                    CategoriesOrBrandsSection(
                            list: viewModel.categoriesList??[]),
                    SizedBox(
                      height: 24.h,
                    ),
                    RowSectionWidget(name: 'Brands'),
                    SizedBox(
                      height: 24.h,
                    ),
                    state is HomeTabBrandLoadingStates
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                        : CategoriesOrBrandsSection(list: viewModel.brandsList!),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
