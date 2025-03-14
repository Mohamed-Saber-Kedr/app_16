part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}
final class CartLoadingState extends CartState {}
final class CartAddSuccess extends CartState {}
final class CartDeletSuccess extends CartState {}
final class CartUpdate extends CartState {}
final class ProductGetSuccess extends CartState {
  final List<ProductModel>listproduct;
  ProductGetSuccess({required this.listproduct});
}
final class CartGetSuccess extends CartState {
  final List<CartModel> listCart;
  CartGetSuccess({required this.listCart});
}

