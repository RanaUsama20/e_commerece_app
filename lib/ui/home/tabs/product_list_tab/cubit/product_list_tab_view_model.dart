import 'package:flutter_app_e_commerece_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_app_e_commerece_online/domain/use_cases/add_to_cart_use_case.dart';
import 'package:flutter_app_e_commerece_online/domain/use_cases/get_all_products_use_case.dart';
import 'package:flutter_app_e_commerece_online/ui/home/tabs/product_list_tab/cubit/product_list_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListTabViewModel extends Cubit<ProductListTabStates> {
  GetAllProductsUseCase getAllProductsUseCase;

  AddToCartUseCase addToCartUseCase;

  ProductListTabViewModel(
      {required this.getAllProductsUseCase, required this.addToCartUseCase})
      : super(ProductListTabInitialStates());

  List<ProductEntity> productsList = [];
  int numOfCartItems = 0;

  static ProductListTabViewModel get(context) => BlocProvider.of(context);

  getProducts() async {
    emit(ProductListTabLoadingStates(loadingMessage: 'Loading...'));
    var either = await getAllProductsUseCase.invoke();
    either.fold((l) {
      emit(ProductListTabErrorStates(errors: l));
    }, (response) {
      productsList = response.data ?? [];
      emit(ProductListTabSuccessStates(productResponseEntity: response));
    });
  }

  addToCart(String productId) async {
    emit(AddToCartLoadingStates(loadingMessage: 'Loading...'));
    var either = await addToCartUseCase.invoke(productId);
    either.fold((l) {
      emit(AddToCartTabErrorStates(errors: l));
    }, (response) {
      numOfCartItems = response.numOfCartItems ?? 0;
      print('numOfCartItems: $numOfCartItems');
      emit(AddToCartSuccessStates(addToCartResponseEntity: response));
    });
  }
}
