import 'package:flutter_app_e_commerece_online/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_app_e_commerece_online/domain/use_cases/get_all_brands_use_case.dart';
import 'package:flutter_app_e_commerece_online/domain/use_cases/get_all_categories_use_case.dart';
import 'package:flutter_app_e_commerece_online/ui/home/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;

  GetAllBrandsUseCase getAllBrandsUseCase;

  HomeTabViewModel(
      {required this.getAllCategoriesUseCase,
      required this.getAllBrandsUseCase})
      : super(HomeTabInitialStates());

  List<CategoryOrBrandEntity>? categoriesList;

  List<CategoryOrBrandEntity>? brandsList ;

  void getCategories() async {
    emit(HomeTabCategoryLoadingStates());
    var either = await getAllCategoriesUseCase.invoke();
    either.fold((l) {
      emit(HomeTabCategoryErrorStates(errorMessage: l.errorMessage));
    }, (response) {
      categoriesList = response.data ;
      if(brandsList != null){
        emit(HomeTabCategorySuccessStates(categoryEntity: response));
      }
    });
  }

  void getBrands() async {
    emit(HomeTabBrandLoadingStates());
    var either = await getAllBrandsUseCase.invoke();
    either.fold((l) {
      emit(HomeTabBrandErrorStates(errors: l));
    }, (response) {
      brandsList = response.data ;
      if(categoriesList != null){
        emit(HomeTabBrandSuccessStates(categoryOrBrandEntity: response));
      }
    });
  }
}
