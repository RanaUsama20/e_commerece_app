import 'package:flutter_app_e_commerece_online/domain/entities/GetCartResponseEntity.dart';
import 'package:flutter_app_e_commerece_online/domain/use_cases/delete_item_in_cart_use_case.dart';
import 'package:flutter_app_e_commerece_online/domain/use_cases/get_cart_use_case.dart';
import 'package:flutter_app_e_commerece_online/domain/use_cases/update_count_in_cart_use_case.dart';
import 'package:flutter_app_e_commerece_online/ui/home/cart/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewModel extends Cubit<CartStates>{
  GetCartUseCase getCartUseCase ;
  DeleteItemInCartUseCase deleteItemInCartUseCase ;
  UpdateCountInCartUseCase updateCountInCartUseCase ;
  CartViewModel({required this.getCartUseCase,
    required this.deleteItemInCartUseCase,
    required this.updateCountInCartUseCase
  }):super(GetCartInitialStates());

    List<GetProductCartEntity> productList = [];

    static CartViewModel get(context) => BlocProvider.of(context);

    getCart() async {
      emit(GetCartLoadingStates(loadingMessage: 'Loading...'));
      var either = await getCartUseCase.invoke();
      either.fold((l) {
        emit(GetCartErrorStates(errors: l));
      }, (response) {
        productList = response.data?.products ?? [];
        emit(GetCartSuccessStates(getCartResponseEntity: response));
      });
    }
    deleteItemInCart(String productId) async {
      emit(DeleteItemInCartLoadingStates(loadingMessage: 'Loading...'));
      var either = await deleteItemInCartUseCase.invoke(productId);
      either.fold((l) {
        emit(DeleteItemInCartErrorStates(errors: l));
      }, (response) {
        print('deleted successfully');
        // productList = response.data?.products ?? [];
        emit(GetCartSuccessStates(getCartResponseEntity: response));
      });
    }
    updateCountInCart(String productId,int count) async {
      emit(UpdateCountInCartLoadingStates(loadingMessage: 'Loading...'));
      var either = await updateCountInCartUseCase.invoke(productId,count);
      either.fold((l) {
        emit(UpdateCountInCartErrorStates(errors: l));
      }, (response) {
        print('update successfully');
        // productList = response.data?.products ?? [];
        emit(GetCartSuccessStates(getCartResponseEntity: response));
      });
    }


}