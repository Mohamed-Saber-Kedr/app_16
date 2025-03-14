import 'package:app_9/feature/cart/Data/cart_data.dart';
import 'package:app_9/feature/cart/model/cart_model.dart';
import 'package:app_9/feature/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  static CartCubit get (context)=>BlocProvider.of(context);
  CartCubit() : super(CartInitial());
  CartData cartData = CartData();
  addCartCubit({required productId})async{
    emit(CartLoadingState());
    await cartData.AddCart(productId: productId);
    emit(CartAddSuccess());
    getProductCubit();
  }

  getCartCubit() async {
    emit(CartLoadingState());
    cartData.GetCart();
    var success= await cartData.GetCart();
    emit(CartGetSuccess(listCart: success));
  }

  getProductCubit() async {
    emit(CartLoadingState());
    cartData.getProduct();
    var success= await cartData.getProduct();
    emit(ProductGetSuccess(listproduct: success));
  }

  deletCartCubit({required productId}) async {
    emit(CartLoadingState());
    await cartData.deletCart(productId: productId);
    emit(CartDeletSuccess());
    getCartCubit();
  }

  updateCartCubit({required id,required quantity})  {
    emit(CartLoadingState());
     cartData.updateCart(id: id, quantity: quantity);
    emit(CartUpdate());
    getCartCubit();
}

}
